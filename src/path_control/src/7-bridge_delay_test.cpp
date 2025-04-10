#include <ros/ros.h>
#include <std_msgs/Header.h>

ros::Publisher pub;

const int number_of_round = 100;
int count = 1;
double max_delay = 0.0;
double min_delay = std::numeric_limits<double>::max();
double total_delay = 0.0;

void callback(const std_msgs::Header::ConstPtr& msg)
{
    ros::Time now = ros::Time::now();
    ros::Duration delay = now - msg->stamp;
    double d = delay.toSec();

    // Update stats
    count++;
    if (d > max_delay) max_delay = d;
    if (d < min_delay) min_delay = d;
    total_delay += d;
    double avg_delay = total_delay / count;
    
    ROS_INFO_STREAM("Round " << count << ":");
    ROS_INFO_STREAM("Delay: " << d << " s | Min: " << min_delay
                    << " s | Max: " << max_delay << " s | Avg: " << avg_delay << " s");

    if (count <= number_of_round)
    {
        // Publish new message immediately
        std_msgs::Header new_msg;
        new_msg.stamp = ros::Time::now();
        pub.publish(new_msg);
    }
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "bridge_delay_test");
    ros::NodeHandle nh;

    pub = nh.advertise<std_msgs::Header>("/to_ros2", 10);
    ros::Subscriber sub = nh.subscribe("/from_ros2", 10, callback);

    // Send initial message
    std_msgs::Header init_msg;
    init_msg.stamp = ros::Time::now();
    pub.publish(init_msg);

    ros::spin();
    return 0;
}
