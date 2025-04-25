import rosbag
import matplotlib.pyplot as plt
import math
import numpy as np

bag_file = '/home/tam/capstone_ws/src/path_control/bag/test-pitch.bag'

setpoint_time = []
setpoint_pitch = []
feedback_time = []
feedback_pitch = []

# Quaternion to pitch conversion function (returns in radians)
def quaternion_to_pitch(q0, q1, q2, q3):
    sinp = 2 * (q0 * q2 - q3 * q1)
    if abs(sinp) >= 1:
        pitch = -np.sign(sinp) * (np.pi / 2)
    else:
        pitch = -math.asin(sinp)
    return pitch  # in radians

with rosbag.Bag(bag_file, 'r') as bag:
    for topic, msg, t in bag.read_messages(topics=['/setpoint', '/feed_back']):
        pitch = quaternion_to_pitch(msg.orientation.w, msg.orientation.x, msg.orientation.y, msg.orientation.z)
        if topic == '/setpoint':
            setpoint_time.append(t.to_sec())
            setpoint_pitch.append(pitch)
        elif topic == '/feed_back':
            feedback_time.append(t.to_sec())
            feedback_pitch.append(pitch)

if setpoint_time:
    start_time = setpoint_time[0]

    # Normalize times
    setpoint_time = [t - start_time for t in setpoint_time]
    feedback_time = [t - start_time for t in feedback_time if t >= start_time]
    feedback_pitch = feedback_pitch[-len(feedback_time):]

    # Prolong signals
    desired_end_time = 10.0
    dt = 0.01

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

    # Convert to degrees
    setpoint_pitch_deg = [math.degrees(p) for p in setpoint_pitch]
    feedback_pitch_deg = [math.degrees(p) for p in feedback_pitch]

    # Calculate error
    pitch_error_deg = [sp - fb for sp, fb in zip(setpoint_pitch_deg, feedback_pitch_deg)]
    setpoint_time_trimmed = setpoint_time[:len(pitch_error_deg)]

    # Plotting
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(10, 10))

    # Pitch plot
    ax1.plot(setpoint_time, setpoint_pitch_deg, label='Setpoint Pitch (°)', color='blue')
    ax1.plot(feedback_time, feedback_pitch_deg, label='Feedback Pitch (°)', color='red')
    ax1.set_xlabel('Time (s)')
    ax1.set_ylabel('Pitch (°)')
    ax1.set_title('Pitch Comparison')
    ax1.legend()
    ax1.grid(True)

    # Error plot
    ax2.plot(setpoint_time_trimmed, pitch_error_deg, label='Pitch Error (°)', color='purple')
    ax2.set_xlabel('Time (s)')
    ax2.set_ylabel('Error (°)')
    ax2.set_title('Pitch Error')
    ax2.legend()
    ax2.grid(True)

    plt.tight_layout()
    plt.show()

else:
    print("No /setpoint data found in the bag.")
