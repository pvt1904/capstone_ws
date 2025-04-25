import rosbag
import matplotlib.pyplot as plt
import numpy as np
import math
from tf.transformations import euler_from_quaternion

bag_file = '/home/tam/capstone_ws/src/path_control/bag/test-pitch.bag'

setpoint_time = []
setpoint_pitch = []
feedback_time = []
feedback_pitch = []

# Read from bag
with rosbag.Bag(bag_file, 'r') as bag:
    for topic, msg, t in bag.read_messages(topics=['/setpoint', '/feed_back']):
        # Extract quaternion
        try:
            q = msg.orientation  # Adjust if needed (e.g., msg.pose.orientation)
            quat = [q.x, q.y, q.z, q.w]
            roll, pitch, yaw = euler_from_quaternion(quat)
            pitch_deg = math.degrees(pitch)
        except AttributeError:
            print(f"⚠️ Skipping message on topic {topic} due to missing orientation")
            continue

        timestamp = t.to_sec()
        if topic == '/setpoint':
            setpoint_time.append(timestamp)
            setpoint_pitch.append(pitch_deg)
        elif topic == '/feed_back':
            feedback_time.append(timestamp)
            feedback_pitch.append(pitch_deg)

# Proceed only if /setpoint is available
if setpoint_time:
    start_time = setpoint_time[0]

    # Normalize time
    setpoint_time = [t - start_time for t in setpoint_time]
    feedback_time = [t - start_time for t in feedback_time if t >= start_time]
    feedback_pitch = feedback_pitch[-len(feedback_time):]

    # Prolong both to 10s
    desired_end_time = 10.0
    dt = 0.01  # 100Hz

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

    # Plotting
    plt.figure(figsize=(10, 6))
    plt.plot(setpoint_time, setpoint_pitch, label='Setpoint Pitch (°)', color='blue')
    plt.plot(feedback_time, feedback_pitch, label='Feedback Pitch (°)', color='red')
    plt.xlabel('Time (s)')
    plt.ylabel('Pitch Angle (°)')
    plt.title('Pitch Response - Quaternion to Euler Conversion')
    plt.legend()
    plt.grid(True)
    plt.xlim([0, 100])
    plt.tight_layout()
    plt.show()
else:
    print("No /setpoint data found in the bag.")
