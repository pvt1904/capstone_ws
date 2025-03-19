#include "ros/ros.h"
#include "path_control/MoveToFirstPosition.h" 
#include "sensor_msgs/JointState.h"
#include "trajectory_msgs/JointTrajectory.h"
#include "trajectory_msgs/JointTrajectoryPoint.h"
#include <vector>

sensor_msgs::JointState current_positions;
bool received_joint_states = false;

// Callback to update current joint states
void jointStateCallback(const sensor_msgs::JointState::ConstPtr& msg) {
    current_positions.position = msg->position;
    current_positions.name = msg->name;
    current_positions.velocity = msg->velocity;
    received_joint_states = true;
}

bool moveToHomePosition(path_control::MoveToFirstPosition::Request &req,
                        path_control::MoveToFirstPosition::Response &res) {
    ROS_INFO("Service called to move to home position.");

    // Ensure we have received current joint states
    if (!received_joint_states) {
        ROS_WARN("No joint states received yet. Cannot move to home position.");
        res.reached = false;
        return false;
    }

    // Define home position (adjust based on your robot)
    std::vector<double> home_position = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};  // Example home positions
    std::vector<double> home_velocity= {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};  // Example home velocities

    // Prepare a publisher for /joint_command
    static ros::NodeHandle nh;
    static ros::Publisher traj_pub = nh.advertise<trajectory_msgs::JointTrajectory>("/joint_command", 10);

    // Publish the start point (current position)
    trajectory_msgs::JointTrajectory start_msg;
    start_msg.joint_names = current_positions.name;
    trajectory_msgs::JointTrajectoryPoint start_point;
    start_point.positions = current_positions.position;
    start_point.velocities = current_positions.velocity;
    start_point.time_from_start = ros::Duration(0.0);
    start_msg.points.push_back(start_point);

    ros::Duration(0.5).sleep(); // Ensure the publisher is ready
    traj_pub.publish(start_msg);
    ROS_INFO("Published start point.");

    // Wait for a short duration before publishing the home point
    ros::Duration(1.0).sleep();  // Adjust delay as necessary

    // Publish the home point
    trajectory_msgs::JointTrajectory home_msg;
    home_msg.joint_names = current_positions.name;
    trajectory_msgs::JointTrajectoryPoint home_point;
    home_point.positions = home_position;
    home_point.velocities = home_velocity;
    home_point.time_from_start = ros::Duration(5.0);  // Adjust timing for motion
    home_msg.points.push_back(home_point);

    traj_pub.publish(home_msg);
    ROS_INFO("Published home point.");

    res.reached = true;
    return true;
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "move_to_home_position_server");
    ros::NodeHandle n;

    // Subscribe to /joint_states to get current positions
    ros::Subscriber joint_state_sub = n.subscribe("/joint_states", 10, jointStateCallback);

    // Advertise the MoveToFirstPosition service
    ros::ServiceServer service = n.advertiseService("move_to_first_position", moveToHomePosition);
    ROS_INFO("Service ready to move robot to home position.");

    ros::spin();

    return 0;
}
