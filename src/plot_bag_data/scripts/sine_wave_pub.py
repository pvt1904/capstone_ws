#!/usr/bin/env python3

import rospy
import numpy as np
from std_msgs.msg import Float32

frequency = 100
sine_frequency = 1
def sine_publisher():
    rospy.init_node('sine_publisher', anonymous=True)
    pub = rospy.Publisher('/sine_wave', Float32, queue_size=10)
    rate = rospy.Rate(frequency)  # 10 Hz

    t = 0.0  # Time variable

    while not rospy.is_shutdown():
        sine_value = np.sin(2 * np.pi * sine_frequency * t)  # 0.5 Hz sine wave
        rospy.loginfo(f"Sine Wave Value: {sine_value}")
        pub.publish(sine_value)

        t += 1/frequency  # Increment time step
        rate.sleep()

if __name__ == '__main__':
    try:
        sine_publisher()
    except rospy.ROSInterruptException:
        pass
