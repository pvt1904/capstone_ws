#include <ros/ros.h>
#include <std_msgs/String.h>
#include <limits>
#include <sstream>

ros::Publisher pub;

const int number_of_round = 100;
int count = 1;
double max_delay = 0.0;
double min_delay = std::numeric_limits<double>::max();
double total_delay = 0.0;

void callback(const std_msgs::String::ConstPtr& msg)
{
    ros::Time now = ros::Time::now();

    // Convert received string to double (timestamp)
    double sent_time;
    std::istringstream iss(msg->data);
    iss >> sent_time;

    double delay = (now.toSec() - sent_time);

    // Update stats
    count++;
    if (delay > max_delay) max_delay = delay;
    if (delay < min_delay) min_delay = delay;
    total_delay += delay;
    double avg_delay = total_delay / count;

    ROS_INFO_STREAM("Round " << count << ":");
    ROS_INFO_STREAM("Delay: " << delay << " s | Min: " << min_delay
                    << " s | Max: " << max_delay << " s | Avg: " << avg_delay << " s");

    if (count <= number_of_round)
    {
        // Create new message with current time
        std_msgs::String new_msg;
        std::ostringstream oss;
        oss << ros::Time::now().toSec();
        new_msg.data = oss.str();
        pub.publish(new_msg);
    }
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "bridge_delay_test");
    ros::NodeHandle nh;

    pub = nh.advertise<std_msgs::String>("/to_ros2", 10);
    ros::Subscriber sub = nh.subscribe("/from_ros2", 10, callback);

    // Send initial message
    std_msgs::String init_msg;
    init_msg.data = "hello";
    pub.publish(init_msg);
    
    ros::spinOnce();  // Allow callbacks & flush publish queue
    ros::Duration(0.1).sleep();
    
    init_msg.data = "hello";
    pub.publish(init_msg);
    

    ros::spin();
    return 0;
}
