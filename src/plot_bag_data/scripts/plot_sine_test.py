import rosbag
import matplotlib.pyplot as plt

# List of bag files
bag_files = [
    '/home/tam/capstone_ws/src/path_control/bag/sine_test/sine_x_0.5hz.bag',
    '/home/tam/capstone_ws/src/path_control/bag/sine_test/sine_x_1hz.bag',
    '/home/tam/capstone_ws/src/path_control/bag/sine_test/sine_x_2hz.bag',
    '/home/tam/capstone_ws/src/path_control/bag/sine_test/sine_x_4hz.bag'
]
titles = [
    '0.5 Hz frequency',
    '1 Hz frequency',
    '2 Hz frequency',
    '4 Hz frequency'
]

# Different x-axis limits for each subplot
x_limits = [
    (0, 10),
    (1, 6),
    (1.5, 5),
    (1.5, 4)
]

# Set default font size for everything
plt.rcParams.update({
    'font.size': 14,         # base font size
    'axes.titlesize': 16,     # subplot title
    'axes.labelsize': 15,     # x and y labels
    'xtick.labelsize': 13,    # x tick labels
    'ytick.labelsize': 13,    # y tick labels
    'legend.fontsize': 13     # legend text
})

# Setup 2x2 subplots
fig, axs = plt.subplots(2, 2, figsize=(14, 10))
axs = axs.flatten()

for idx, bag_file in enumerate(bag_files):
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

    if setpoint_time:
        start_time = setpoint_time[0]

        # Normalize times
        setpoint_time = [t - start_time for t in setpoint_time]
        feedback_time = [t - start_time for t in feedback_time if t >= start_time]

        feedback_x = feedback_x[-len(feedback_time):]

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

        setpoint_time, setpoint_x = prolong_signal(setpoint_time, setpoint_x, desired_end_time)
        feedback_time, feedback_x = prolong_signal(feedback_time, feedback_x, desired_end_time)

        # Plotting
        ax = axs[idx]
        ax.plot(setpoint_time, setpoint_x, label='/setpoint/position/x', color='blue', linestyle='--')
        ax.plot(feedback_time, feedback_x, label='/feed_back/position/x', color='red', linestyle='-')
        ax.set_xlabel('Time (s)')
        ax.set_ylabel('Position x (mm)')
        ax.set_title(titles[idx])
        ax.grid(True)
        ax.set_xlim(x_limits[idx])  # Different xlim for each plot
        ax.legend(loc='lower right')
    else:
        print(f"No /setpoint data found in {bag_file}")

plt.tight_layout()
plt.show()

# hehehehheheheheheh
