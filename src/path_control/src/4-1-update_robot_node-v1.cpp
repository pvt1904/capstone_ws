#include <ros/ros.h>
#include <trajectory_msgs/JointTrajectory.h>
#include <trajectory_msgs/JointTrajectoryPoint.h>
#include <sensor_msgs/JointState.h>
#include <path_control/ControllMsg.h>

std::vector<double> initial_positions;
bool received_initial_position = false;
bool initial_position_published = false;
ros::Time start_time;
//ros::Duration time_from_start;
bool first_message_received = false;

// Callback to get the initial position from /joint_states
void jointStateInitialCallback(const sensor_msgs::JointState::ConstPtr& msg) {
    if (!received_initial_position) {
        initial_positions = msg->position;
        received_initial_position = true;
        ROS_INFO("Received initial position from /joint_states.");
    }
}

// Function to publish the initial position once
void publishInitialPosition(ros::Publisher& pub) {
    trajectory_msgs::JointTrajectory trajectory_msg;
    trajectory_msg.joint_names = {"joint_1_s", "joint_2_l", "joint_3_u", "joint_4_r", "joint_5_b", "joint_6_t"};

    trajectory_msgs::JointTrajectoryPoint start_point;
    start_point.positions = initial_positions;
    start_point.velocities = std::vector<double>(initial_positions.size(), 0.0);
    start_point.time_from_start = ros::Duration(0.0);

    trajectory_msg.points.push_back(start_point);
    pub.publish(trajectory_msg);
    // for (int i = 0; i < 10; i++)
    // {
    //     start_point.time_from_start += ros::Duration(0.00001);
    //     trajectory_msg.points.push_back(start_point);
    //     pub.publish(trajectory_msg);
    // }
    
    ROS_INFO("Published initial position with zero velocity to /joint_command.");
}

// Callback to get positions and velocities from /controll_signal and publish to /joint_command
void controllSignalCallback(const path_control::ControllMsg::ConstPtr& msg, ros::Publisher& pub) {
    if (!received_initial_position) {
        ROS_WARN("Initial position not yet received. Skipping message.");
        return;
    }

    // Publish initial position once
    if (!initial_position_published) {
        publishInitialPosition(pub);
        initial_position_published = true;
        start_time = ros::Time::now();  // Record real-time start
        first_message_received = true;
    }

    if (!first_message_received) {
        ROS_WARN("First message timestamp not initialized. Skipping message.");
        return;
    }

    // Calculate time_from_start based on real elapsed time
    static ros::Duration time_from_start;
    if (msg->is_trusted_msg) {
        time_from_start = ros::Time::now() - start_time;
        ROS_INFO("Time from start: %f", time_from_start.toSec());
    }
    else {
        time_from_start = time_from_start + ros::Duration(static_cast<double>(msg->dt));
        ROS_INFO("Time from start: %f", time_from_start.toSec());
    }

    ROS_INFO("time from start: %f \n", ros::Duration(msg->dt).toSec());
    // Publish each new point as a separate trajectory
    trajectory_msgs::JointTrajectory trajectory_msg;
    trajectory_msg.joint_names = {"joint_1_s", "joint_2_l", "joint_3_u", "joint_4_r", "joint_5_b", "joint_6_t"};

    trajectory_msgs::JointTrajectoryPoint traj_point;
    traj_point.positions = msg->positions;
    traj_point.velocities = msg->velocities;
    traj_point.time_from_start = time_from_start;

    trajectory_msg.points.push_back(traj_point);
    pub.publish(trajectory_msg);
    //ROS_INFO("Published trajectory point from /controll_signal to /joint_command.");
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "trajectory_command_node");
    ros::NodeHandle nh;

    ros::Subscriber joint_state_initial_sub = nh.subscribe("/joint_states", 10, jointStateInitialCallback);
    ros::Publisher joint_command_pub = nh.advertise<trajectory_msgs::JointTrajectory>("/joint_command", 1);

    ros::Subscriber joint_state_from_bag_sub = nh.subscribe<path_control::ControllMsg>(
        "/controll_signal", 10,
        boost::bind(&controllSignalCallback, _1, boost::ref(joint_command_pub))
    );
 
    ROS_INFO("Node initialized and waiting for data...");
    ros::spin();
    return 0;
}
