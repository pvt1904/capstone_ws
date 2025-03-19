#include <ros/ros.h>
#include <path_control/EndEffectorState.h>
#include <cmath>  // for std::abs

path_control::EndEffectorState setpoint_msg;
bool setpoint_received = false; // Flag to ensure setpoint is received

// Callback for /feed_back topic
void feedbackCallback(const path_control::EndEffectorState::ConstPtr& msg) {
    static int i = 1;
    static double error_x_sum = 0, error_y_sum = 0, error_z_sum = 0;
    static double error_x_avg = 0, error_y_avg = 0, error_z_avg = 0;

    if (!setpoint_received) {
        ROS_WARN("Waiting for setpoint before computing errors...");
        return;
    }

    error_x_sum += std::abs(msg->position.x - setpoint_msg.position.x);
    error_y_sum += std::abs(msg->position.y - setpoint_msg.position.y);
    error_z_sum += std::abs(msg->position.z - setpoint_msg.position.z);

    error_x_avg = error_x_sum / i;
    error_y_avg = error_y_sum / i;
    error_z_avg = error_z_sum / i;

    i++;

    ROS_INFO("Error: x = %f, y = %f, z = %f", error_x_avg, error_y_avg, error_z_avg);
}

// Callback for /setpoint topic
void setpointCallback(const path_control::EndEffectorState::ConstPtr& msg) {
    setpoint_msg = *msg; // Assign the entire message
    setpoint_received = true; // Mark that setpoint has been received
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "error_calculator");
    ros::NodeHandle nh;

    // Subscribers
    ros::Subscriber feedback_sub = nh.subscribe("/feed_back", 10, feedbackCallback);
    ros::Subscriber setpoint_sub = nh.subscribe("/setpoint", 10, setpointCallback);

    ros::spin(); 

    return 0;
}
