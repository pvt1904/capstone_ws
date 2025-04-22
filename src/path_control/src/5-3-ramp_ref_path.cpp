#include <ros/ros.h>
#include <path_control/EndEffectorState.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <iostream>
#include <cmath>

const double x_0 = 0.185; //unit m
const double y_0 = 0.0;
const double z_0 = 0.268;
const double roll_0 = 0.0;
const double pitch_0 = 0.0;
const double yaw_0 = 0.0;

const int pub_frequency = 500;

enum OutputSelection {
    X, Y, Z, ROLL, PITCH, YAW
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "ramp_publisher");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<path_control::EndEffectorState>("/setpoint", 10);
    ros::Rate loop_rate(pub_frequency);

    int selection;
    double final_value, slope;

    std::cout << "Select parameter to ramp:\n0: X\n1: Y\n2: Z\n3: Roll\n4: Pitch\n5: Yaw\n";
    std::cin >> selection;

    std::cout << "Enter final value: ";
    std::cin >> final_value;

    std::cout << "Enter slope (mm/s): ";
    std::cin >> slope;
    slope = slope / 1000;

    ROS_INFO("Waiting 3 seconds...");
    ros::Duration(3.0).sleep();

    double current_value = 0.0;
    switch (selection) {
        case X: current_value = x_0; break;
        case Y: current_value = y_0; break;
        case Z: current_value = z_0; break;
        case ROLL: current_value = roll_0; break;
        case PITCH: current_value = pitch_0; break;
        case YAW: current_value = yaw_0; break;
    }

    path_control::EndEffectorState msg;
    for (int i = 0; i < pub_frequency * 2; i++) 
    {
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

        msg.roll = roll_0;
        msg.pitch = pitch_0;
        msg.roll = roll_0;

        pub.publish(msg);
        loop_rate.sleep();
    }

    double direction = (final_value >= current_value) ? 1.0 : -1.0;

    // path_control::EndEffectorState msg;

    while (ros::ok() && direction * (final_value - current_value) > 0) {
        switch (selection) {
            case X: msg.position.x = current_value; msg.position.y = y_0; msg.position.z = z_0; break;
            case Y: msg.position.x = x_0; msg.position.y = current_value; msg.position.z = z_0; break;
            case Z: msg.position.x = x_0; msg.position.y = y_0; msg.position.z = current_value; break;
            case ROLL: msg.position.x = x_0; msg.position.y = y_0; msg.position.z = z_0; msg.roll = current_value; break;
            case PITCH: msg.position.x = x_0; msg.position.y = y_0; msg.position.z = z_0; msg.pitch = current_value; break;
            case YAW: msg.position.x = x_0; msg.position.y = y_0; msg.position.z = z_0; msg.yaw = current_value; break;
        }

        if (selection < ROLL) {
            msg.roll = roll_0;
            msg.pitch = pitch_0;
            msg.yaw = yaw_0;
        } else {
            msg.roll = (selection == ROLL) ? current_value : roll_0;
            msg.pitch = (selection == PITCH) ? current_value : pitch_0;
            msg.yaw = (selection == YAW) ? current_value : yaw_0;
        }

        tf2::Quaternion q;
        q.setRPY(msg.roll, msg.pitch, msg.yaw);
        tf2::convert(q, msg.orientation);

        pub.publish(msg);

        current_value += direction * slope / pub_frequency;
        loop_rate.sleep();
    }

    // Publish the final position or orientation for 5 seconds
    ROS_INFO("Finished ramping. Publishing final position for 5 more seconds...");
    for (int i = 0; i < 100 * pub_frequency; i++) {
        switch (selection) {
            case X: msg.position.x = final_value; break;
            case Y: msg.position.y = final_value; break;
            case Z: msg.position.z = final_value; break;
            case ROLL: msg.roll = final_value; break;
            case PITCH: msg.pitch = final_value; break;
            case YAW: msg.yaw = final_value; break;
        }

        // Convert RPY to quaternion
        tf2::Quaternion q;
        q.setRPY(msg.roll, msg.pitch, msg.yaw);

        // Convert tf2 Quaternion to geometry_msgs::Quaternion
        geometry_msgs::Quaternion quat_msg;
        tf2::convert(q, quat_msg);
        msg.orientation = quat_msg;

        pub.publish(msg);
        loop_rate.sleep();
    }

    ROS_INFO("Reached target value. Done.");
    return 0;
}
