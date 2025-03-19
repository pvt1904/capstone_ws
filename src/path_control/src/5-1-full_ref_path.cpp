#include <ros/ros.h>
#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <geometry_msgs/Pose.h>
#include <path_control/EndEffectorState.h>

int main(int argc, char** argv) {
    ros::init(argc, argv, "ref_path");
    ros::NodeHandle nh;

    // Publisher for the /joint_states topic
    //ros::Publisher joint_states_pub = nh.advertise<sensor_msgs::JointState>("/joint_states", 10);
    ros::Publisher setpoint_pub = nh.advertise<path_control::EndEffectorState>("/setpoint", 10);

    rosbag::Bag bag;
    try {
        bag.open("/home/tam/capstone_ws/src/path_control/bag/setpoint_ref.bag", rosbag::bagmode::Read);
    } catch (rosbag::BagException& e) {
        ROS_ERROR("Failed to open bag file: %s", e.what());
        return 1;
    }

    // Get the /combined_sensor_data topic from the bag
    std::vector<std::string> topics;
    topics.push_back("/combined_sensor_data");
    rosbag::View view(bag, rosbag::TopicQuery(topics));

    // Set a rate to control publishing speed
    ros::Rate rate(100);  // Adjust as needed for playback speed

    // Initialize the sequence number, starting from the current sequence in the first message
    uint32_t seq = 0;

    // Iterator for the bag messages
    auto it = view.begin();

    // While loop with ros::ok() to allow safe shutdown
    while (ros::ok() && it != view.end()) {
        geometry_msgs::Pose::ConstPtr end_effector_state_msg = it->instantiate<geometry_msgs::Pose>();

        if (end_effector_state_msg != nullptr) {
            // Copy the message to modify the header timestamp and sequence number
            path_control::EndEffectorState modified_msg;
            modified_msg.position.x = end_effector_state_msg->position.x / 1000;
            modified_msg.position.y = end_effector_state_msg->position.y / 1000;
            modified_msg.position.z = end_effector_state_msg->position.z / 1000;
            // modified_msg.orientation.w = end_effector_state_msg->orientation.w;
            // modified_msg.orientation.x = end_effector_state_msg->orientation.x;
            // modified_msg.orientation.y = end_effector_state_msg->orientation.y;
            // modified_msg.orientation.z = end_effector_state_msg->orientation.z;
            modified_msg.orientation.w = 1;
            modified_msg.orientation.x = 0;
            modified_msg.orientation.y = 0;
            modified_msg.orientation.z = 0;
            // Publish the modified message
            setpoint_pub.publish(modified_msg);

            // Sleep to maintain the loop rate
            rate.sleep();

            // Allow for callbacks to happen while looping
            ros::spinOnce();
        }

        ++it;  // Move to the next message in the bag
    }

    // Close the bag file
    bag.close();

    ROS_INFO("Finished publishing messages from bag file.");
    return 0;
}