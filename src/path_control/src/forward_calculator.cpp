#include <ros/ros.h>
#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Float64MultiArray.h>

#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

void computeForwardKinematics(const sensor_msgs::JointState::ConstPtr& msg, ros::Publisher& pub) {
    // Load robot model once
    static robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
    static robot_model::RobotModelPtr kinematic_model = robot_model_loader.getModel();
    static robot_state::RobotState kinematic_state(kinematic_model);
    kinematic_state.setToDefaultValues();

    // Get joint model group
    const robot_state::JointModelGroup* joint_model_group = kinematic_model->getJointModelGroup("arm");
    if (!joint_model_group) {
        ROS_ERROR("Planning group 'arm' not found!");
        return;
    }

    // Set joint positions
    kinematic_state.setJointGroupPositions(joint_model_group, msg->position);

    // Compute Forward Kinematics
    const Eigen::Isometry3d& tool_state = kinematic_state.getGlobalLinkTransform("tool0");
    Eigen::Vector3d translation = tool_state.translation();
    Eigen::Vector3d rpy = tool_state.rotation().eulerAngles(2, 1, 0); // ZYX order (yaw, pitch, roll)

    // Print results
    ROS_INFO_STREAM("FK Position: [" << translation.x() << ", " << translation.y() << ", " << translation.z() << "]");
    ROS_INFO_STREAM("FK Orientation (RPY): [" << rpy[2] << ", " << rpy[1] << ", " << rpy[0] << "]");

    // Publish results as std::vector<double>
    std_msgs::Float64MultiArray desired_point_msg;
    desired_point_msg.data = {translation.x(), translation.y(), translation.z(), rpy[2], rpy[1], rpy[0]};
    pub.publish(desired_point_msg);
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "read_from_bag");
    ros::NodeHandle nh;

    // Publisher for /joint_states_read_from_bag
    ros::Publisher joint_states_pub = nh.advertise<sensor_msgs::JointState>("/joint_states_read_from_bag", 10);
    ros::Publisher desired_point_pub = nh.advertise<std_msgs::Float64MultiArray>("/desired_point", 10);

    // Open the bag file
    rosbag::Bag bag;
    try {
        bag.open("/home/tam/capstone_ws/result.bag", rosbag::bagmode::Read);
    } catch (rosbag::BagException& e) {
        ROS_ERROR("Failed to open bag file: %s", e.what());
        return 1;
    }

    // Get the /joint_states topic from the bag
    rosbag::View view(bag, rosbag::TopicQuery("/joint_states"));

    ros::Rate rate(37);  // Adjust playback speed

    uint32_t seq = 0;
    for (auto it = view.begin(); it != view.end() && ros::ok(); ++it) {
        sensor_msgs::JointState::ConstPtr joint_state_msg = it->instantiate<sensor_msgs::JointState>();

        if (joint_state_msg) {
            // Modify the message header
            sensor_msgs::JointState modified_msg = *joint_state_msg;
            modified_msg.header.stamp = ros::Time::now();
            modified_msg.header.seq = seq++;

            // Publish joint states and compute FK
            joint_states_pub.publish(modified_msg);
            computeForwardKinematics(joint_state_msg, desired_point_pub);

            rate.sleep();
            ros::spinOnce();
        }
    }

    bag.close();
    ROS_INFO("Finished publishing messages from bag file.");
    return 0;
}
