/*position: [-0.0962497815489769, 0.27301788330078125, 0.18582642078399658, 0.5193036198616028, 0.4334518611431122, 1.5260040760040283]
position: [0.05456159636378288, 0.3051394522190094, 0.11013981699943542, 0.5850602984428406, 0.44689974188804626, 1.3229050636291504]
*/
#include <ros/ros.h>
#include <trajectory_msgs/JointTrajectory.h>
#include <trajectory_msgs/JointTrajectoryPoint.h>
#include <sensor_msgs/JointState.h>

#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

robot_model::RobotModelPtr kinematic_model;
robot_state::RobotStatePtr kinematic_state;
std::vector<double> joint_values = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
Eigen::Isometry3d tool_state = Eigen::Isometry3d::Identity();
Eigen::Vector3d reference_point_position(0.0, 0.0, 0.0); // Reference point relative to the end-effector
Eigen::MatrixXd jacobian;
Eigen::Matrix<double, 6, 1> q = Eigen::Matrix<double, 6, 1>::Zero();
Eigen::Matrix<double, 6, 1> pre_qdot = Eigen::Matrix<double, 6, 1>::Zero();
Eigen::Matrix<double, 6, 1> pre_e = Eigen::Matrix<double, 6, 1>::Zero();

sensor_msgs::JointState latest_joint_state;
bool first_point_publised = false;
bool first_joint_state_received = false;
double pre_stamp, pre_time_from_start;  // Global time tracker

void jointStateCallback(const sensor_msgs::JointState::ConstPtr& msg) {
    first_joint_state_received = true;

    latest_joint_state.header = msg->header;
    latest_joint_state.position = msg->position;
    latest_joint_state.velocity = msg->velocity;
    latest_joint_state.effort = msg->effort;

    // const robot_state::JointModelGroup* joint_model_group = kinematic_model->getJointModelGroup("arm");
    // if (!joint_model_group) {
    //     ROS_ERROR("Planning group 'manipulator' not found!");
    //     return;
    // }

    // // Get Joint Values
    // // ^^^^^^^^^^^^^^^^
    // kinematic_state->setJointGroupPositions(joint_model_group, joint_positions);
    
    // kinematic_state->copyJointGroupPositions(joint_model_group, joint_values);

    // // Forward Kinematics
    // // ^^^^^^^^^^^^^^^^
    // tool_state = kinematic_state->getGlobalLinkTransform("tool0");

    // // Inverse Kinematics
    // // ^^^^^^^^^^^^^^^^^^
    // std::size_t attempts = 10;
    // double timeout = 0.1;
    // bool found_ik = kinematic_state->setFromIK(joint_model_group, tool_state, attempts, timeout);

    // // Get the Jacobian
    // bool success = kinematic_state->getJacobian(
    //     joint_model_group,
    //     kinematic_state->getLinkModel(joint_model_group->getLinkModelNames().back()),
    //     reference_point_position,
    //     jacobian
    // );
   
}

void jointStateFromBagCallback(const sensor_msgs::JointState::ConstPtr& msg, ros::Publisher& pub) {
    ROS_INFO("done");
    if (!first_joint_state_received) {
        return;
    }

    trajectory_msgs::JointTrajectory trajectory_msg;
    trajectory_msgs::JointTrajectoryPoint traj_point;
    trajectory_msg.joint_names = {"joint_1_s", "joint_2_l", "joint_3_u", "joint_4_r", "joint_5_b", "joint_6_t"};

    if (!first_point_publised) {
        // Publish the initial point with zero velocities
        traj_point.positions = latest_joint_state.position;
        traj_point.velocities = std::vector<double>(6, 0.0);  // Zero velocities
        traj_point.time_from_start = ros::Duration(0.0);
        
        trajectory_msg.points.push_back(traj_point);
        pub.publish(trajectory_msg);
        
        //update previous var
        pre_stamp = ros::Time::now().toSec();
        pre_time_from_start = traj_point.time_from_start.toSec();

        
        first_point_publised = true;
        return;
    }
    //compute vector r{x, y, z, r, p, y} setpoint
    Eigen::Matrix<double, 6, 1> r;
    r << msg->position[0], msg->position[1], msg->position[2], msg->position[3], msg->position[4], msg->position[5];

    //compute vector p{x, y, z, r, p, y} feedback position
    // Forward Kinematics
    const robot_state::JointModelGroup* joint_model_group = kinematic_model->getJointModelGroup("arm");
    if (!joint_model_group) {
        ROS_ERROR("Planning group 'manipulator' not found!");
        return;
    }

    kinematic_state->setJointGroupPositions(joint_model_group, latest_joint_state.position);
    tool_state = kinematic_state->getGlobalLinkTransform("tool0");
    Eigen::Vector3d translation = tool_state.translation();
    Eigen::Matrix3d rotation = tool_state.rotation();
    Eigen::Vector3d rpy = rotation.eulerAngles(2, 1, 0);
    Eigen::Matrix<double, 6, 1> p;
    p << translation[0], translation[1], translation[2], rpy[0], rpy[1], rpy[2];

    //compute vector e{x, y, z, r, p, y} error of setpoint vs feedback
    Eigen::Matrix<double, 6, 1> e = r - p;    

    //compute vector v{xdot, ydot, zdot, rdot, pdot, ydot} velocity aka derivative of the error
    double dt = ros::Time::now().toSec() - pre_stamp;
    Eigen::Matrix<double, 6, 1> v = (e - pre_e) / dt;
    pre_e = e;

    //compute vector qdot{q1dot, q2dot, q3dot, q4dot, q5dot, q6dot} joint angle velocity
    bool success = kinematic_state->getJacobian(
        joint_model_group,
        kinematic_state->getLinkModel(joint_model_group->getLinkModelNames().back()),
        reference_point_position,
        jacobian
    );
    Eigen::Matrix<double, 6, 1> qdot = jacobian.inverse()*v;

    //compute vector q{q1, q2, q3, q4, q5, q6} joint angle aka integration of qdot
    q = q + (pre_qdot + qdot)*dt/2;
    pre_qdot = qdot;
    

    traj_point.positions = {q[0], q[1], q[2], q[3], q[4], q[5]};
    traj_point.velocities = {qdot[0], qdot[1], qdot[2], qdot[3], qdot[4], qdot[5]};

    traj_point.time_from_start = ros::Duration(pre_time_from_start + ros::Time::now().toSec() - pre_stamp);
    pre_time_from_start =  traj_point.time_from_start.toSec();
    pre_stamp = ros::Time::now().toSec();
    trajectory_msg.points.push_back(traj_point);

    pub.publish(trajectory_msg);
    ROS_INFO("Published trajectory point to /joint_command.");

    
}


int main(int argc, char** argv) {
    ros::init(argc, argv, "trajectory_command_node");
    ros::NodeHandle nh;

    // Load the robot model
    robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
    kinematic_model = robot_model_loader.getModel();
    ROS_INFO("Model frame: %s", kinematic_model->getModelFrame().c_str());

    // Create a RobotState and set it to default values
    kinematic_state.reset(new robot_state::RobotState(kinematic_model));
    kinematic_state->setToDefaultValues();

    // Specify the planning group
    const robot_state::JointModelGroup* joint_model_group = kinematic_model->getJointModelGroup("arm");
    if (!joint_model_group) {
        ROS_ERROR("Planning group 'arm' not found!");
        return 1;
    }
    
    const std::vector<std::string> joint_names = joint_model_group->getVariableNames();

    // Subscriber to calculate robot model and robot state
    ros::Subscriber joint_state_sub = nh.subscribe("/joint_states", 10, jointStateCallback);

    // Publisher for the /joint_command topic
    ros::Publisher joint_command_pub = nh.advertise<trajectory_msgs::JointTrajectory>("/joint_command", 10);
 
    // Subscriber to get the data from /joint_states_read_from_bag and publish to /joint_command
    ros::Subscriber joint_state_from_bag_sub = nh.subscribe<sensor_msgs::JointState>(
        "/joint_states_read_from_bag", 10,
        boost::bind(&jointStateFromBagCallback, _1, boost::ref(joint_command_pub))
    );

    ros::spin();
    return 0;
}
