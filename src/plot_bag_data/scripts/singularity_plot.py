import rosbag
import matplotlib.pyplot as plt

bag_file = '/home/tam/capstone_ws/src/plot_bag_data/bag/singularities/test_singularity_pos_ref_path_1.bag'

# Joint indices: Joint 1 = 0, Joint 5 = 4
joint_indices = [0, 4]
joint_labels = ['Joint 1', 'Joint 5']

time_norm = [[] for _ in joint_indices]
vel_norm = [[] for _ in joint_indices]
time_raw = [[] for _ in joint_indices]
vel_raw = [[] for _ in joint_indices]

with rosbag.Bag(bag_file, 'r') as bag:
    for topic, msg, t in bag.read_messages(topics=[
        '/control_signal_with_norm_Jacob',
        '/control_signal'
    ]):
        timestamp = t.to_sec()

        if hasattr(msg, 'joint') and len(msg.joint.velocity) > max(joint_indices):
            for i, idx in enumerate(joint_indices):
                if topic == '/control_signal_with_norm_Jacob':
                    time_norm[i].append(timestamp)
                    vel_norm[i].append(msg.joint.velocity[idx] / 2)
                elif topic == '/control_signal':
                    time_raw[i].append(timestamp)
                    vel_raw[i].append(msg.joint.velocity[idx] / 2)

# Normalize and plot
if all(time_norm) and all(time_raw):
    start_time = min(min(t[0] for t in time_norm), min(t[0] for t in time_raw))
    time_norm = [[t - start_time for t in joint_time] for joint_time in time_norm]
    time_raw = [[t - start_time for t in joint_time] for joint_time in time_raw]

    plt.rcParams.update({
        'font.size': 14,
        'axes.titlesize': 16,
        'axes.labelsize': 15,
        'xtick.labelsize': 13,
        'ytick.labelsize': 13,
        'legend.fontsize': 13
    })

    fig, axes = plt.subplots(2, 1, figsize=(10, 8), sharex=True)

    for i in range(2):
        ax = axes[i]
        ax.plot(time_norm[i], vel_norm[i], label='With Normal Jacobian', color='blue')
        ax.plot(time_raw[i], vel_raw[i], label='With DLS Algorithm', color='red')
        ax.set_title(f'{joint_labels[i]} Velocity')
        ax.set_ylabel('Velocity (rad/s)')
        ax.grid(True)
        ax.legend()

    axes[-1].set_xlabel('Time (s)')
    plt.suptitle('Joint Velocities Comparison (Joint 1 & 5)', fontsize=18)
    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.show()
else:
    print("No data found in the specified topics or joint velocities missing.")
