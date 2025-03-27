#include <ros/ros.h>
#include <path_control/EndEffectorState.h>
#include <std_msgs/Float64MultiArray.h>

#include <tf2/LinearMath/Quaternion.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>

double roll_0 = 0.0;   
double pitch_0 = 0.0;
double yaw_0 = 0.0;

const double x_0 = 0.185;
const double y_0 = 0.0;
const double z_0 = 0.268;

double quat_w0 = 1.0;
double quat_x0 = 0.0;
double quat_y0 = 0.0;
double quat_z0 = 0.0;

const int frequency = 500;
const int time_interval = 10;
const int total_steps = frequency * time_interval;

enum OutputSelection { 
    X,
    Y,
    Z,
    ROLL,
    PITCH,
    YAW
}; 

int main(int argc, char** argv) {
    ros::init(argc, argv, "ref_path");
    ros::NodeHandle nh;
    ros::Publisher pub = nh.advertise<path_control::EndEffectorState>("/setpoint", 10);
    ros::Rate loop_rate(frequency);

    double sine_frequency = 1;
    double sine_amplitude = 0.01;
    int sine_selection;
    std::cout << "----------- Sinudsoidal test -----------" << std::endl;
    do
    {
        std::cout << "Select the parameter to apply the sine wave:\n";
        std::cout << "  0: X\n  1: Y\n  2: Z\n  3: Roll\n   4: Pitch\n  5: Yaw\n";
        std::cin >> sine_selection;
        if (0 <= sine_selection && sine_selection <= 5) {
            break;
        }
        else {
            std::cout << "Invalid option, try again ..." << std::endl;
        }
    } while (true);
    bool approved = false;
    do
    {   
        std::cout << "Input frequency: ";
        std::cin >> sine_frequency;
        std::cout << "Input amplitude: ";
        std::cin >> sine_amplitude;
        switch (sine_selection)
        {
        case X:
        case Y:
        case Z:
            if (sine_amplitude < 0.3) {
                approved = true;
            }
            break;
        case ROLL:
        case PITCH:
        case YAW:
            if (sine_amplitude < 60.0) {
                sine_amplitude = sine_amplitude * M_PI / 180;
                approved = true;
            }
            break;
        default:
            break;
        }
        if (!approved) {
            std::cout << "Invalid amplitude, try again ..." << std::endl;
        }
    } while (!approved);
    
    path_control::EndEffectorState msg;
    for (int i = 0; i < frequency * 2; i++)
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

    for (int time_step = 0; time_step < total_steps; time_step++) {
        double sine_value = sine_amplitude * std::sin(2 * M_PI * sine_frequency * time_step / frequency);

        switch (sine_selection) {
            case X: msg.position.x = sine_value + x_0; break;
            case Y: msg.position.y = sine_value + y_0; break;
            case Z: msg.position.z = sine_value + z_0; break;
            case ROLL: msg.roll = sine_value + roll_0; break;
            case PITCH: msg.pitch = sine_value + pitch_0; break;
            case YAW: msg.yaw = sine_value + yaw_0; break;
        }
        // Convert RPY to quaternion
        tf2::Quaternion q;
        // q.setRPY(msg.roll, msg.pitch, msg.yaw);

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
