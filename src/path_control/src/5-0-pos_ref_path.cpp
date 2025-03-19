#include <ros/ros.h>
#include <path_control/EndEffectorState.h>
#include <std_msgs/Float64MultiArray.h>

#include <tf2/LinearMath/Quaternion.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>

double roll_0 = 0.0;   
double pitch_0 = 0.0;
double yaw_0 = 0.0;

double roll_f = 0.5;   
double pitch_f = 0.6;
double yaw_f = 0.7;

const double x_0 = 0.185;
const double y_0 = 0.0;
const double z_0 = 0.268;

const double quat_w0 = 1.0;
const double quat_x0 = 0.0;
const double quat_y0 = 0.0;
const double quat_z0 = 0.0;

const double x_f = 0.2;
const double y_f = 0.1;
const double z_f = 0.2;

const double quat_wf = 1.0;
const double quat_xf = 0.0;
const double quat_yf = 0.0;
const double quat_zf = 0.0;

const int frequency = 50;
const int time_interval = 2;
const int total_steps = frequency * time_interval;

int main(int argc, char** argv) {
    ros::init(argc, argv, "ref_path");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<path_control::EndEffectorState>("/setpoint", 10);
    ros::Rate loop_rate(frequency);
    for (int i = 0; i < total_steps; i++)
    {
        path_control::EndEffectorState msg;
        msg.position.x = x_0;
        msg.position.y = y_0;
        msg.position.z = z_0;
        
        // Convert RPY to quaternion
        tf2::Quaternion q;
        q.setRPY(roll_0, pitch_0, yaw_0);

        // Convert tf2 Quaternion to geometry_msgs::Quaternion
        geometry_msgs::Quaternion quat_msg;
        tf2::convert(q, quat_msg);
        msg.orientation = quat_msg;

        pub.publish(msg);
        loop_rate.sleep();
    }
    for (int time_step = 0; time_step < total_steps; time_step++)
    {
        path_control::EndEffectorState msg;
        msg.position.x = (x_f - x_0) * time_step / total_steps + x_0;
        msg.position.y = (y_f - y_0) * time_step / total_steps + y_0;
        msg.position.z = (z_f - z_0) * time_step / total_steps + z_0;

        static double roll, pitch, yaw;
        roll = (roll_f - roll_0) *time_step / total_steps + roll_0;
        pitch = (pitch_f - pitch_0) *time_step / total_steps + pitch_0;
        yaw = (yaw_f - yaw_0) *time_step / total_steps + yaw_0;

        // Convert RPY to quaternion
        tf2::Quaternion q;
        q.setRPY(roll, pitch, yaw);

        // Convert tf2 Quaternion to geometry_msgs::Quaternion
        geometry_msgs::Quaternion quat_msg;
        tf2::convert(q, quat_msg);
        msg.orientation = quat_msg;

        pub.publish(msg);
        loop_rate.sleep();
    }
    for (int i = 0; i < total_steps*3; i++)
    {
        path_control::EndEffectorState msg;
        msg.position.x = x_f;
        msg.position.y = y_f;
        msg.position.z = z_f;
        
        // Convert RPY to quaternion
        tf2::Quaternion q;
        q.setRPY(roll_f, pitch_f, yaw_f);

        // Convert tf2 Quaternion to geometry_msgs::Quaternion
        geometry_msgs::Quaternion quat_msg;
        tf2::convert(q, quat_msg);
        msg.orientation = quat_msg;

        pub.publish(msg);
        loop_rate.sleep();
    }
    
    ROS_INFO("Finished.");
    return 0;
}

// rqt_plot /desired_point/position/x /desired_point/position/y /desired_point/position/z
