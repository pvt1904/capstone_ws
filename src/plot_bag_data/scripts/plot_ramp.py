import rosbag
import matplotlib.pyplot as plt

bag_file = '/home/tam/capstone_ws/src/plot_bag_data/bag/ramp_Kp_1.25_50mm.bag'

setpoint_time = []
setpoint_x = []
feedback_time = []
feedback_x = []

with rosbag.Bag(bag_file, 'r') as bag:
    for topic, msg, t in bag.read_messages(topics=['/setpoint', '/feed_back']):
        if topic == '/setpoint':
            setpoint_time.append(t.to_sec())
            setpoint_x.append(msg.position.x * 1000)
        elif topic == '/feed_back':
            feedback_time.append(t.to_sec())
            feedback_x.append(msg.position.x * 1000)

# Only continue if setpoint is found
if setpoint_time:
    start_time = setpoint_time[0]

    # Normalize times
    setpoint_time = [t - start_time for t in setpoint_time]
    feedback_time = [t - start_time for t in feedback_time if t >= start_time]

    feedback_x = feedback_x[-len(feedback_time):]

    # Prolong both to 10s
    desired_end_time = 10.0
    dt = 0.01  # interval (100Hz)

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

    setpoint_time, setpoint_x = prolong_signal(setpoint_time, setpoint_x, desired_end_time)
    feedback_time, feedback_x = prolong_signal(feedback_time, feedback_x, desired_end_time)

    # Plotting
    plt.figure(figsize=(10, 6))
    plt.plot(setpoint_time, setpoint_x, label='/setpoint/position/x', color='blue')
    plt.plot(feedback_time, feedback_x, label='/feed_back/position/x', color='red')
    plt.xlabel('Time (s)')
    plt.ylabel('Position x (mm)')
    # plt.title('Reponse of Position x with Damping-constant = 0.5')
    plt.title('Reponse of Position x with K_p = 0.5')
    plt.legend()
    plt.grid(True)
    plt.xlim([0, 10])  # explicitly set x-axis to 10s
    plt.tight_layout()
    plt.show()
else:
    print("No /setpoint data found in the bag.")
