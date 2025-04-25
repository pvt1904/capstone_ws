import rosbag
import matplotlib.pyplot as plt
import math
import numpy as np

bag_file = '/home/tam/capstone_ws/src/path_control/bag/sine_test/sine_roll_0.5hz.bag'

setpoint_time = []
setpoint_pitch = []
feedback_time = []
feedback_pitch = []

# Function to convert quaternion to roll, pitch, yaw
def quaternion_to_euler(q0, q1, q2, q3):
    roll = math.atan2(2 * (q0 * q1 + q2 * q3), 1 - 2 * (q1**2 + q2**2))
    sinp = 2 * (q0 * q2 - q3 * q1)
    if abs(sinp) >= 1:
        pitch = -np.sign(sinp) * (np.pi / 2)
    else:
        pitch = -math.asin(sinp)
    yaw = -math.atan2(2 * (q0 * q3 + q1 * q2), 1 - 2 * (q2**2 + q3**2))
    return roll, pitch, yaw

with rosbag.Bag(bag_file, 'r') as bag:
    for topic, msg, t in bag.read_messages(topics=['/setpoint', '/feed_back']):
        if topic == '/setpoint':
            setpoint_time.append(t.to_sec())
            # Extract quaternion and convert to pitch
            q0 = msg.orientation.w
            q1 = msg.orientation.x
            q2 = msg.orientation.y
            q3 = msg.orientation.z
            _, pitch, _ = quaternion_to_euler(q0, q1, q2, q3)
            setpoint_pitch.append(pitch * 180 / np.pi)  # Convert pitch to degrees
        elif topic == '/feed_back':
            feedback_time.append(t.to_sec())
            # Extract quaternion and convert to pitch
            q0 = msg.orientation.w
            q1 = msg.orientation.x
            q2 = msg.orientation.y
            q3 = msg.orientation.z
            _, pitch, _ = quaternion_to_euler(q0, q1, q2, q3)
            feedback_pitch.append(pitch * 180 / np.pi)  # Convert pitch to degrees

# Only continue if setpoint is found
if setpoint_time:
    start_time = setpoint_time[0]

    # Normalize times
    setpoint_time = [t - start_time for t in setpoint_time]
    feedback_time = [t - start_time for t in feedback_time if t >= start_time]

    feedback_pitch = feedback_pitch[-len(feedback_time):]

    # Prolong both to 10s
    desired_end_time = 10.0
    dt = 0.01  # Interval (100Hz)

    def prolong_signal(time_list, value_list, target_duration):
        if not time_list:
            return [], []
        last_time = time_list[-1]
        last_value = value_list[-1]
        while last_time < target_duration:
            last_time += dt
            time_list.append(last_time)
            value_list.append(last_value)
        return time_list, value_list

    setpoint_time, setpoint_pitch = prolong_signal(setpoint_time, setpoint_pitch, desired_end_time)
    feedback_time, feedback_pitch = prolong_signal(feedback_time, feedback_pitch, desired_end_time)

    # Plotting pitch angles
    plt.figure(figsize=(10, 6))
    plt.plot(setpoint_time, setpoint_pitch, label='/setpoint/pitch', color='blue')
    plt.plot(feedback_time, feedback_pitch, label='/feed_back/pitch', color='red')
    plt.xlabel('Time (s)')
    plt.ylabel('Pitch Angle (degrees)')
    plt.title('Pitch Angle: Setpoint vs Feedback')
    plt.legend()
    plt.grid(True)
    plt.xlim([0, 20])  # Set x-axis limit to 10 seconds
    plt.tight_layout()
    plt.show()
else:
    print("No /setpoint data found in the bag.")
