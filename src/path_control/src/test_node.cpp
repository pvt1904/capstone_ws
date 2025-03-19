#include <ros/ros.h>
#include <trajectory_msgs/JointTrajectory.h>
#include <trajectory_msgs/JointTrajectoryPoint.h>
#include <sensor_msgs/JointState.h>
#include <path_control/EndEffectorState.h>

const std::vector<double> q_0 = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
const std::vector<double> q_f = {M_PI/4, M_PI/4, M_PI/4, M_PI/4, M_PI/4, M_PI/4};
std::vector<double> q = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
std::vector<double> q_last = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
std::vector<double> q_dot = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
std::vector<std::string> q_name = {"joint_1_s", "joint_2_l", "joint_3_u", "joint_4_r", "joint_5_b", "joint_6_t"};
const double frequency = 74;
const double time_interval = 4;
const double total_step = frequency * time_interval;

int main(int argc, char** argv) {
    ros::init(argc, argv, "test_node");
    ros::NodeHandle nh;
    ros::Rate rate(frequency);
    ros::Publisher controll_signal_pub = nh.advertise<sensor_msgs::JointState>("/controll_signal", 10);
    ROS_INFO("Node initialized and waiting for data...");
    for (auto time_step = 0; time_step < total_step; time_step++)
    {
        for (int i = 0; i < q_0.size(); i++)
        {
            q[i] = (q_f[i] - q_0[i]) * time_step / total_step + q_0[i];
            q_dot[i] = (q[i] - q_last[i]) * frequency;
            q_last[i] = q[i];
        }
        sensor_msgs::JointState controll_signal_msg;
        controll_signal_msg.name = q_name;
        controll_signal_msg.position = q;
        controll_signal_msg.velocity = q_dot;
        controll_signal_pub.publish(controll_signal_msg);
        ROS_INFO("publish joint.");

        rate.sleep();
    }
    

    return 0;
}
