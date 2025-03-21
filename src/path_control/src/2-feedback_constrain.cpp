#include <ros/ros.h>
#include <std_msgs/Float64MultiArray.h>
#include <sensor_msgs/JointState.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>
#include <path_control/EndEffectorState.h>

class SetpointPublisher {
public:
    SetpointPublisher() : robot_model_loader_("robot_description") {
        sub_ = nh_.subscribe("/joint_states", 1, &SetpointPublisher::jointStateCallback, this);
        pub_ = nh_.advertise<path_control::EndEffectorState>("/feed_back", 1);
        robot_model_ = robot_model_loader_.getModel();
        robot_state_ = std::make_shared<robot_state::RobotState>(robot_model_);
    }

    void jointStateCallback(const sensor_msgs::JointState& msg) {
        has_new_data_ = true;

        // Calculate forward kinematics
        const robot_state::JointModelGroup* joint_model_group = robot_model_->getJointModelGroup("arm");
        if (!joint_model_group) {
            ROS_ERROR("Planning group 'arm' not found!");
            return;
        }
        robot_state_->setVariablePositions(msg.name, msg.position);
        robot_state_->update();
        const Eigen::Isometry3d& end_effector_state = robot_state_->getGlobalLinkTransform("link_6_t");
        Eigen::Vector3d position =  end_effector_state.translation();
        Eigen::Quaterniond quaternion(end_effector_state.rotation());
        Eigen::Vector3d rpy = end_effector_state.rotation().eulerAngles(0, 1, 2);

        path_control::EndEffectorState feed_back_msg;
        feed_back_msg.position.x = position.x();
        feed_back_msg.position.y = position.y();
        feed_back_msg.position.z = position.z();
        feed_back_msg.orientation.w = quaternion.w();
        feed_back_msg.orientation.x = quaternion.x();
        feed_back_msg.orientation.y = quaternion.y();
        feed_back_msg.orientation.z = quaternion.z();
        // for plot only, no meaning in controll
        feed_back_msg.roll = rpy[0];
        feed_back_msg.pitch = rpy[1];
        feed_back_msg.yaw = rpy[2];

        feed_back_msg.joint = msg;
        pub_.publish(feed_back_msg);
    }

    // void publishLoop() {
    //     ros::Rate rate(37); // 37 Hz loop rate
    //     while (ros::ok()) {
    //         if (has_new_data_) {
    //             pub_.publish(latest_data_);
    //             has_new_data_ = false; // Reset flag after publishing
    //             old_data_count = 0;
    //         }
    //         else if (old_data_count == MAX_COUNT) {
    //             ROS_ERROR("setpoint_publisher waits too long.");
    //             ros::shutdown();
    //             break;
    //         }
    //         else {
    //             old_data_count++;
    //             pub_.publish(latest_data_);
    //         }
                
    //         ros::spinOnce();
    //         rate.sleep();
    //     }
    // }

private:
    ros::NodeHandle nh_;
    ros::Subscriber sub_;
    ros::Publisher pub_;
    std_msgs::Float64MultiArray latest_data_;
    robot_model_loader::RobotModelLoader robot_model_loader_;
    robot_model::RobotModelPtr robot_model_;
    robot_state::RobotStatePtr robot_state_;
    int old_data_count = 0;
    const int MAX_COUNT = 3;
    bool has_new_data_ = false;
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "feedback_publisher");
    SetpointPublisher sp;
    ros::spin();
    return 0;
}
