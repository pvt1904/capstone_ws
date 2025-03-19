#include <ros/ros.h>
#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Header.h>

int main(int argc, char** argv) {
    ros::init(argc, argv, "read_from_bag");
    ros::NodeHandle nh;

    // Publisher for the /joint_states topic
    //ros::Publisher joint_states_pub = nh.advertise<sensor_msgs::JointState>("/joint_states", 10);
    ros::Publisher joint_states_pub = nh.advertise<sensor_msgs::JointState>("/joint_states_read_from_bag", 10);

    rosbag::Bag bag;
    try {
        bag.open("/home/tam/capstone_ws/src/path_control/src/ref_path.bag", rosbag::bagmode::Read);
    } catch (rosbag::BagException& e) {
        ROS_ERROR("Failed to open bag file: %s", e.what());
        return 1;
    }

    // Get the /joint_states topic from the bag
    std::vector<std::string> topics;
    topics.push_back("/joint_states");
    rosbag::View view(bag, rosbag::TopicQuery(topics));

    // Set a rate to control publishing speed
    ros::Rate rate(37);  // Adjust as needed for playback speed

    // Initialize the sequence number, starting from the current sequence in the first message
    uint32_t seq = 0;

    // Iterator for the bag messages
    auto it = view.begin();

    // While loop with ros::ok() to allow safe shutdown
    while (ros::ok() && it != view.end()) {
        sensor_msgs::JointState::ConstPtr joint_state_msg = it->instantiate<sensor_msgs::JointState>();
        
        if (joint_state_msg != nullptr) {
            // Copy the message to modify the header timestamp and sequence number
            sensor_msgs::JointState modified_msg = *joint_state_msg;
            modified_msg.header.stamp = ros::Time::now();
            modified_msg.header.seq = seq++;  // Increment the seq number for each message

            // Publish the modified message
            joint_states_pub.publish(modified_msg);

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