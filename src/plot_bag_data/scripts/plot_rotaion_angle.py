import rosbag
import matplotlib.pyplot as plt
import numpy as np
import math
from tf.transformations import euler_from_quaternion

bag_file = '/home/tam/capstone_ws/src/plot_bag_data/bag/singularities/test_orient.bag'

setpoint_time = []
setpoint_yaw = []
feedback_time = []
feedback_yaw = []

# Read from bag
with rosbag.Bag(bag_file, 'r') as bag:
    for topic, msg, t in bag.read_messages(topics=['/setpoint', '/feed_back']):
        # Extract quaternion
        try:
            q = msg.orientation  # Adjust if needed (e.g., msg.pose.orientation)
            quat = [q.x, q.y, q.z, q.w]
            roll, pitch, yaw = euler_from_quaternion(quat)
            yaw_deg = math.degrees(yaw)
        except AttributeError:
            print(f"Skipping message on topic {topic} due to missing orientation")
            continue

        timestamp = t.to_sec()
        if topic == '/setpoint':
            setpoint_time.append(timestamp)
            setpoint_yaw.append(yaw_deg)
        elif topic == '/feed_back':
            feedback_time.append(timestamp)
            feedback_yaw.append(yaw_deg)

# Proceed only if /setpoint is available
if setpoint_time:
    start_time = setpoint_time[0]

    # Normalize time
    setpoint_time = [t - start_time for t in setpoint_time]
    feedback_time = [t - start_time for t in feedback_time if t >= start_time]
    feedback_yaw = feedback_yaw[-len(feedback_time):]

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

    setpoint_time, setpoint_yaw = prolong_signal(setpoint_time, setpoint_yaw, desired_end_time)
    feedback_time, feedback_yaw = prolong_signal(feedback_time, feedback_yaw, desired_end_time)

    # Plotting

    # Set default font size for everything
    plt.rcParams.update({
        'font.size': 14,         # base font size
        'axes.titlesize': 16,     # subplot title
        'axes.labelsize': 15,     # x and y labels
        'xtick.labelsize': 13,    # x tick labels
        'ytick.labelsize': 13,    # y tick labels
        'legend.fontsize': 13     # legend text
    })
    
    plt.figure(figsize=(10, 6))
    plt.plot(setpoint_time, setpoint_yaw, label='Setpoint (°)', color='blue')
    plt.plot(feedback_time, feedback_yaw, label='Feedback (°)', color='red')
    plt.xlabel('Time (s)')
    plt.ylabel('Rotation Angle (°)')
    plt.title('Orientation Response')
    plt.legend()
    plt.grid(True)
    plt.xlim([0, 225])  # Updated to match 10 seconds of data
    plt.tight_layout()
    plt.show()
else:
    print("No /setpoint data found in the bag.")
