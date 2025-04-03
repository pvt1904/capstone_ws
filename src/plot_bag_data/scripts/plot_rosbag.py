import rosbag
import matplotlib.pyplot as plt
import numpy as np
from path_control.msg import EndEffectorState

def plot_bag(file_path, topic_name):
    timestamps = []
    x_data, y_data, z_data = [], [], []
    roll_data, pitch_data, yaw_data = [], [], []

    with rosbag.Bag(file_path, 'r') as bag:
        for topic, msg, t in bag.read_messages(topics=[topic_name]):
            timestamps.append(t.to_sec())
            x_data.append(msg.position.x)
            y_data.append(msg.position.y)
            z_data.append(msg.position.z)
            roll_data.append(msg.roll)
            pitch_data.append(msg.pitch)
            yaw_data.append(msg.yaw)
    
    timestamps = np.array(timestamps)
    timestamps -= timestamps[0]  # Normalize time
    
    plt.figure(figsize=(12, 6))
    plt.subplot(2, 1, 1)
    plt.plot(timestamps, x_data, label='X')
    plt.plot(timestamps, y_data, label='Y')
    plt.plot(timestamps, z_data, label='Z')
    plt.xlabel('Time (s)')
    plt.ylabel('Position (m)')
    plt.legend()
    plt.title('End Effector Position')
    
    plt.subplot(2, 1, 2)
    plt.plot(timestamps, roll_data, label='Roll')
    plt.plot(timestamps, pitch_data, label='Pitch')
    plt.plot(timestamps, yaw_data, label='Yaw')
    plt.xlabel('Time (s)')
    plt.ylabel('Orientation (rad)')
    plt.legend()
    plt.title('End Effector Orientation')
    
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    bag_file = "/home/tam/capstone_ws/src/plot_bag_data/bag/ref-path-1-4.bag"  # Change this if needed
    topic = "/feed_back"
    plot_bag(bag_file, topic)
