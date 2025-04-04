// x2 controll speed by prediction the next position

#include <ros/ros.h>
#include <path_control/EndEffectorState.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>
#include <path_control/ControllMsg.h>
#include <cmath>
#include <iostream>
// Global variables to store received data
path_control::EndEffectorState feedback_msg;
path_control::EndEffectorState setpoint_msg;
std::vector<double> q_e, q;
std::vector<std::string> q_name = {"joint_1_s", "joint_2_l", "joint_3_u", "joint_4_r", "joint_5_b", "joint_6_t"};
bool first_feedback_received = false;
bool setpoint_received = false;
ros::Time last_stamp;
// MoveIt variables
robot_model::RobotModelPtr robot_model_;
robot_state::RobotStatePtr robot_state_;
// DLS method variables
float damp = 0.5;
float K = 1.85;
float frequency = 37.2*2;

// Conversion factor from degrees to radians
#define DEG_TO_RAD  (M_PI / 180.0)
#define TOLERANCE   (10 * DEG_TO_RAD)
// Maximum motion range in radians
#define JOINT_1_S_MAX_POS   (170 * DEG_TO_RAD)
#define JOINT_1_S_MIN_POS   (-170 * DEG_TO_RAD)
#define JOINT_2_L_MAX_POS   (90 * DEG_TO_RAD)
#define JOINT_2_L_MIN_POS   (-85 * DEG_TO_RAD)
#define JOINT_3_U_MAX_POS   (120 * DEG_TO_RAD)
#define JOINT_3_U_MIN_POS   (-175 * DEG_TO_RAD)
#define JOINT_4_R_MAX_POS   (140 * DEG_TO_RAD)
#define JOINT_4_R_MIN_POS   (-140 * DEG_TO_RAD)
#define JOINT_5_B_MAX_POS   (210 * DEG_TO_RAD)
#define JOINT_5_B_MIN_POS   (-30 * DEG_TO_RAD)
#define JOINT_6_T_MAX_POS   (360 * DEG_TO_RAD)
#define JOINT_6_T_MIN_POS   (-360 * DEG_TO_RAD)
const std::vector<double> JOINT_MAX_POS = {JOINT_1_S_MAX_POS - TOLERANCE, JOINT_2_L_MAX_POS - TOLERANCE, 
                                           JOINT_3_U_MAX_POS - TOLERANCE, JOINT_4_R_MAX_POS - TOLERANCE, 
                                           JOINT_5_B_MAX_POS - TOLERANCE, JOINT_6_T_MAX_POS - TOLERANCE};
const std::vector<double> JOINT_MIN_POS = {JOINT_1_S_MIN_POS + TOLERANCE, JOINT_2_L_MIN_POS + TOLERANCE, 
                                           JOINT_3_U_MIN_POS + TOLERANCE, JOINT_4_R_MIN_POS + TOLERANCE, 
                                           JOINT_5_B_MIN_POS + TOLERANCE, JOINT_6_T_MIN_POS + TOLERANCE};

// Maximum speed in radians per second
#define JOINT_1_S_MAX_SPEED (315 * DEG_TO_RAD)
#define JOINT_2_L_MAX_SPEED (315 * DEG_TO_RAD)
#define JOINT_3_U_MAX_SPEED (420 * DEG_TO_RAD)
#define JOINT_4_R_MAX_SPEED (600 * DEG_TO_RAD)
#define JOINT_5_B_MAX_SPEED (600 * DEG_TO_RAD)
#define JOINT_6_T_MAX_SPEED (600 * DEG_TO_RAD)
const std::vector<double> JOINT_MAX_SPEED = {JOINT_1_S_MAX_SPEED - TOLERANCE, JOINT_2_L_MAX_SPEED - TOLERANCE, 
                                             JOINT_3_U_MAX_SPEED - TOLERANCE, JOINT_4_R_MAX_SPEED - TOLERANCE, 
                                             JOINT_5_B_MAX_SPEED - TOLERANCE, JOINT_6_T_MAX_SPEED - TOLERANCE};

// Functions declaration
void feedbackCallback(const path_control::EndEffectorState::ConstPtr& msg, ros::Publisher& pub);
void setpointCallback(const path_control::EndEffectorState::ConstPtr& msg);
void controllSignalPub(ros::Publisher& pub, path_control::EndEffectorState setpoint, path_control::EndEffectorState feedback, std::vector<double>& q_predict, bool is_trusted_msg);

// Callback for /feed_back
void feedbackCallback(const path_control::EndEffectorState::ConstPtr& msg, ros::Publisher& pub) {
    ROS_INFO("begin");
    if (!setpoint_received)
    {
        //ROS_INFO("hehe");
        return;
    }
    if (!first_feedback_received)
    {
        first_feedback_received = true;
        last_stamp = ros::Time::now();
        return;
    }
    feedback_msg = *msg; q_e = feedback_msg.joint.position;
    
    std::vector<double> q_predict;
    controllSignalPub(pub, setpoint_msg, feedback_msg, q_predict, true);

    // Calculate forward kinematics
    const robot_state::JointModelGroup* joint_model_group = robot_model_->getJointModelGroup("arm");
    if (!joint_model_group) {
        ROS_ERROR("Planning group 'arm' not found!");
        return;
    }
    robot_state_->setVariablePositions(q_name, q_predict);
    robot_state_->update();
    const Eigen::Isometry3d& end_effector_state = robot_state_->getGlobalLinkTransform("link_6_t");
    Eigen::Vector3d position =  end_effector_state.translation();
    Eigen::Quaterniond quaternion(end_effector_state.rotation());
    feedback_msg.position.x = position.x();
    feedback_msg.position.y = position.y();
    feedback_msg.position.z = position.z();
    feedback_msg.orientation.w = quaternion.w();
    feedback_msg.orientation.x = quaternion.x();
    feedback_msg.orientation.y = quaternion.y();
    feedback_msg.orientation.z = quaternion.z();
    q_e = q_predict;
    controllSignalPub(pub, setpoint_msg, feedback_msg, q_predict, false);
    ROS_INFO("end");
}

// Callback for /set_point
void setpointCallback(const path_control::EndEffectorState::ConstPtr& msg) {
    setpoint_msg = *msg;
    setpoint_received = true;
    // ROS_INFO("Received /setpoint data.");
}

void controllSignalPub(ros::Publisher& pub, path_control::EndEffectorState setpoint, path_control::EndEffectorState feedback, std::vector<double>& q_predict, bool is_trusted_msg) {
    Eigen::VectorXd error(6);
    //position error
    error(0) = setpoint.position.x - feedback.position.x;
    error(1) = setpoint.position.y - feedback.position.y;
    error(2) = setpoint.position.z - feedback.position.z;

    // //orientation error with respect to quaternion
    Eigen::Vector4d quat_d(setpoint.orientation.w, setpoint.orientation.x, setpoint.orientation.y, setpoint.orientation.z);
    Eigen::Vector4d quat_e(feedback.orientation.w, feedback.orientation.x, feedback.orientation.y, feedback.orientation.z);
    // Eigen::Vector3d v_d = quat_d.tail(3);
    // Eigen::Vector3d v_e = quat_e.tail(3);
    // error.tail(3) = quat_e(0) * v_d - quat_d(0) * v_e - v_d.cross(v_e);
    // ROS_INFO_STREAM("error with respect to quaternion: \n" << error << "\n");

    //orientation error with respect to angle and axis
    Eigen::Quaterniond quat_d_(quat_d(0), quat_d(1), quat_d(2), quat_d(3));
    Eigen::Quaterniond quat_e_(quat_e(0), quat_e(1), quat_e(2), quat_e(3));
    Eigen::Matrix3Xd rot_d = quat_d_.toRotationMatrix();
    Eigen::Matrix3Xd rot_e = quat_e_.toRotationMatrix();
    Eigen::Vector3d n_d = rot_d.col(0);
    Eigen::Vector3d s_d = rot_d.col(1);
    Eigen::Vector3d a_d = rot_d.col(2);
    Eigen::Vector3d n_e = rot_e.col(0);
    Eigen::Vector3d s_e = rot_e.col(1);
    Eigen::Vector3d a_e = rot_e.col(2);
    error.tail(3) = 0.5 * (n_e.cross(n_d) + s_e.cross(s_d) + a_e.cross(a_d));
    error = K * error; // amplify the error
    //ROS_INFO_STREAM("error with respect to angle and axis: \n" << error << "\n");

    //calculate Jacobian
    const robot_state::JointModelGroup* joint_model_group = robot_model_->getJointModelGroup("arm");
    robot_state_->setVariablePositions(q_name, q_e);
    robot_state_->update();
    Eigen::MatrixXd J;
    Eigen::Vector3d reference_point_position(0.0, 0.0, 0.0);
    robot_state_->getJacobian(
        joint_model_group,
        robot_state_->getLinkModel(joint_model_group->getLinkModelNames().back()),
        reference_point_position,
        J,
        false
    );
    //std::cout << "Matrix J size: " << J.rows() << "x" << J.cols() << std::endl;
    //std::cout << "Matrix error size: " << error.rows() << "x" << error.cols() << std::endl;

    Eigen::VectorXd dq = J.transpose() * (J * J.transpose() + damp * damp * Eigen::MatrixXd::Identity(6, 6)).inverse() * error;

    // Cacculate velocities
    //double dt = (ros::Time::now() - last_stamp).toSec();
    //if (dt < 1e-6) dt = 1e-6; // Prevent division by zero
    double dt = 1/frequency;
    Eigen::VectorXd q_dot_vector = dq / dt;
    std::vector<double> q_dot(q_dot_vector.data(), q_dot_vector.data() + q_dot_vector.size());
    for (int i = 0; i < q_dot.size(); i++)
    {
        q_dot[i] =  std::abs(q_dot[i]);
        q_dot[i] = (q_dot[i] > JOINT_MAX_SPEED[i]) ? JOINT_MAX_SPEED[i] : q_dot[i];
    }
    
    // Calculate positions
    Eigen::VectorXd q_vector = Eigen::VectorXd::Map(feedback.joint.position.data(), feedback.joint.position.size());
    q_vector = q_vector + dq;
    std::vector<double> q(q_vector.data(), q_vector.data() + q_vector.size());
    for (int i = 0; i < q.size(); i++)
    {
        q[i] = (q[i] > JOINT_MAX_POS[i]) ? JOINT_MAX_POS[i] : q[i];
        q[i] = (q[i] < JOINT_MIN_POS[i]) ? JOINT_MIN_POS[i] : q[i];
    }

    // Publish controll signal
    path_control::ControllMsg controll_signal_msg;
    controll_signal_msg.positions = q;
    controll_signal_msg.velocities = q_dot;
    controll_signal_msg.dt = dt;
    controll_signal_msg.is_trusted_msg = is_trusted_msg;
    pub.publish(controll_signal_msg);

    q_predict = q;
    //last_stamp = ros::Time::now();
    //ROS_INFO("end");
}
int main(int argc, char** argv) {
    std::cout << "damp: ";
    std::cin >> damp;
    std::cout << "K: ";
    std::cin >> K;
    ros::init(argc, argv, "controller");
    ros::NodeHandle nh;

    robot_model_loader::RobotModelLoader robot_model_loader_("robot_description");
    robot_model_ = robot_model_loader_.getModel();
    if (!robot_model_) {
        ROS_ERROR("Failed to load robot model!");
        return 1;
    }

    robot_state_ = std::make_shared<robot_state::RobotState>(robot_model_);
    robot_state_->setToDefaultValues();

    ros::Publisher controll_signal_pub = nh.advertise<path_control::ControllMsg>("/controll_signal", 10);
    ros::Subscriber feedback_sub = nh.subscribe<path_control::EndEffectorState>(
        "/feed_back", 10, boost::bind(&feedbackCallback, _1, boost::ref(controll_signal_pub))
    );
    ros::Subscriber setpoint_sub = nh.subscribe("/setpoint", 10, setpointCallback);

    // Use a multi-threaded spinner
    ros::AsyncSpinner spinner(2);  // Two threads for callbacks
    spinner.start();
    ros::waitForShutdown();  // Wait indefinitely

    return 0;
}