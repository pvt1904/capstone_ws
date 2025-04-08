#include <ros/ros.h>
#include <path_control/EndEffectorState.h>
#include <std_msgs/Float64MultiArray.h>
#include <geometry_msgs/Pose.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2/LinearMath/Matrix3x3.h>

class SetpointPublisher {
public:
    SetpointPublisher() {
        sub_ = nh_.subscribe("/combined_pose", 1, &SetpointPublisher::desiredPointCallback, this);
        pub_ = nh_.advertise<path_control::EndEffectorState>("/setpoint", 1);
    }

    void desiredPointCallback(const geometry_msgs::Pose msg) {
        first_desired_point_received = true;
        latest_data_.position = msg.position; // Store the newest data
        latest_data_.orientation = msg.orientation;

        // convert to roll, pitch, yaw for plotting only
        tf2::Quaternion q(
            msg.orientation.x,
            msg.orientation.y,
            msg.orientation.z,
            msg.orientation.w
        );
    
        tf2::Matrix3x3 m(q);
        m.getRPY(latest_data_.roll, latest_data_.pitch, latest_data_.yaw);

        has_new_data_ = true;
    }

    void publishLoop() {
        ros::Rate rate(100); // 100 Hz loop rate
        while (ros::ok()) {
            if (!first_desired_point_received) {
                ros::spinOnce();
                rate.sleep();
                continue;
            }

            if (has_new_data_) {
                pub_.publish(latest_data_); // Publish only the latest data
                has_new_data_ = false;
            }
            else if (has_new_data_ == MAX_COUNT) {
                ROS_ERROR("setpoint_publisher waits too long.");
                ros::shutdown();
                break;
            }
            else {
                old_data_count++;
                pub_.publish(latest_data_);
            }
            
            ros::spinOnce();
            rate.sleep();
        }
    }

private:
    ros::NodeHandle nh_;
    ros::Subscriber sub_;
    ros::Publisher pub_;
    path_control::EndEffectorState latest_data_;
    int old_data_count = 0;
    const int MAX_COUNT = 6;
    bool has_new_data_ = false;
    bool first_desired_point_received = false;
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "setpoint_publisher");
    SetpointPublisher sp;
    sp.publishLoop();
    return 0;
}
