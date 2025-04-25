import sys
import subprocess
import rospy
from sensor_msgs.msg import JointState
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from PyQt5.QtWidgets import (
    QApplication, QWidget, QLabel, QLineEdit, QPushButton,
    QVBoxLayout, QHBoxLayout, QMessageBox, QGroupBox
)

class RobotLauncher(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Motoman Robot Launcher")
        # Init ROS node
        rospy.init_node('robot_launcher_py', anonymous=True, disable_signals=True)
        # Joint state subscriber
        self.current_joint_states = None
        rospy.Subscriber('/joint_states', JointState, self.joint_states_cb)
        # Trajectory publisher
        self.traj_pub = rospy.Publisher('/joint_command', JointTrajectory, queue_size=1)
        # GUI process handle
        self.interface_process = None
        self.init_ui()

    def init_ui(self):
        main_layout = QVBoxLayout()

        # Connection group
        conn_group = QGroupBox("Connection")
        conn_layout = QVBoxLayout()
        # IP
        ip_layout = QHBoxLayout()
        ip_layout.addWidget(QLabel("Robot IP:"))
        self.ip_input = QLineEdit()
        ip_layout.addWidget(self.ip_input)
        conn_layout.addLayout(ip_layout)
        # Controller
        ctrl_layout = QHBoxLayout()
        ctrl_layout.addWidget(QLabel("Controller:"))
        self.ctrl_input = QLineEdit("yrc1000")
        ctrl_layout.addWidget(self.ctrl_input)
        conn_layout.addLayout(ctrl_layout)
        # Buttons
        for txt, func in [
            ("Launch Robot Interface", self.launch_interface),
            ("Disconnect Interface", self.disconnect_interface),
            ("Launch RVIZ Demo", self.launch_demo),
            ("Check Robot Connection", self.check_connection)
        ]:
            btn = QPushButton(txt)
            btn.clicked.connect(func)
            conn_layout.addWidget(btn)
        conn_group.setLayout(conn_layout)
        main_layout.addWidget(conn_group)

        # Control Panel group
        control_group = QGroupBox("Control Panel")
        control_layout = QVBoxLayout()

        # Servo
        servo_layout = QHBoxLayout()
        self.servo_on_btn = QPushButton("Servo ON")
        self.servo_on_btn.clicked.connect(lambda: self.call_service('/robot_enable', 'Enable'))
        self.servo_off_btn = QPushButton("Servo OFF")
        self.servo_off_btn.clicked.connect(lambda: self.call_service('/robot_disable', 'Disable'))
        servo_layout.addWidget(self.servo_on_btn)
        servo_layout.addWidget(self.servo_off_btn)
        control_layout.addLayout(servo_layout)

        # Move to Desired Joint Angles
        joint_angle_group = QGroupBox("Move to Desired Joint Angles (in degrees)")
        joint_angle_layout = QHBoxLayout()
        self.joint_inputs = []
        for i in range(6):
            joint_input = QLineEdit()
            joint_input.setPlaceholderText(f"Joint {i+1}")
            joint_angle_layout.addWidget(joint_input)
            self.joint_inputs.append(joint_input)
        # Small "Move" button for joint angles
        self.move_joint_btn = QPushButton("Move")
        self.move_joint_btn.setFixedSize(50, 25)
        self.move_joint_btn.clicked.connect(self.move_to_joint_angles)
        joint_angle_layout.addWidget(self.move_joint_btn)
        joint_angle_group.setLayout(joint_angle_layout)
        control_layout.addWidget(joint_angle_group)

        # Move to Desired Pose
        pose_group = QGroupBox("Move to Desired Pose (in mm)")
        pose_layout = QHBoxLayout()
        self.pose_inputs = []
        for label in ["X", "Y", "Z", "Qw", "Qx", "Qy", "Qz"]:
            pose_input = QLineEdit()
            pose_input.setPlaceholderText(label)
            pose_layout.addWidget(pose_input)
            self.pose_inputs.append(pose_input)
        # Small "Move" button for pose
        self.move_pose_btn = QPushButton("Move")
        self.move_pose_btn.setFixedSize(50, 25)
        self.move_pose_btn.clicked.connect(self.move_to_pose)
        pose_layout.addWidget(self.move_pose_btn)
        pose_group.setLayout(pose_layout)
        control_layout.addWidget(pose_group)

        # Go Home
        home_layout = QHBoxLayout()
        home_layout.addWidget(QLabel("Time to Home (s):"))
        self.time_input = QLineEdit("1.0")
        home_layout.addWidget(self.time_input)
        self.go_home_btn = QPushButton("Go Home")
        self.go_home_btn.clicked.connect(self.go_home)
        home_layout.addWidget(self.go_home_btn)
        control_layout.addLayout(home_layout)

        # Run/Stop Nodes
        node_group = QGroupBox("Run/Stop Nodes")
        node_layout = QVBoxLayout()
        for node_name in ["sensor_constrain", "feedback_constrain", "controller", "update_robot_node"]:
            node_layout.addLayout(self.create_run_stop_layout(node_name))
        node_group.setLayout(node_layout)
        control_layout.addWidget(node_group)

        control_group.setLayout(control_layout)
        main_layout.addWidget(control_group)

        self.setLayout(main_layout)

    def create_run_stop_layout(self, node_name):
        layout = QHBoxLayout()
        run_button = QPushButton(f"Run {node_name}")
        run_button.clicked.connect(lambda: self.run_node(node_name, "run"))
        stop_button = QPushButton(f"Stop {node_name}")
        stop_button.clicked.connect(lambda: self.run_node(node_name, "stop"))
        layout.addWidget(run_button)
        layout.addWidget(stop_button)
        return layout

    def joint_states_cb(self, msg):
        self.current_joint_states = msg

    def launch_interface(self):
        ip = self.ip_input.text().strip()
        ctrl = self.ctrl_input.text().strip()
        if not ip or not ctrl:
            QMessageBox.warning(self, "Input Error", "Enter both IP and controller.")
            return
        cmd = f"roslaunch motoman_motomini_support robot_interface_streaming_motomini.launch controller:={ctrl} robot_ip:={ip}"
        try:
            self.interface_process = subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            QMessageBox.information(self, "Launching", "Robot interface launching...")
        except Exception as e:
            QMessageBox.critical(self, "Launch Failed", str(e))

    def disconnect_interface(self):
        if self.interface_process and self.interface_process.poll() is None:
            self.interface_process.terminate()
            self.interface_process.wait()
            QMessageBox.information(self, "Disconnected", "Robot interface stopped.")
            self.interface_process = None
        else:
            QMessageBox.information(self, "Info", "No interface running.")

    def launch_demo(self):
        try:
            subprocess.Popen("roslaunch motomini demo.launch", shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            QMessageBox.information(self, "Launching", "Demo launching...")
        except Exception as e:
            QMessageBox.critical(self, "Launch Failed", str(e))

    def check_connection(self):
        try:
            subprocess.check_output(["rostopic","echo","-n1","/joint_states"], stderr=subprocess.STDOUT, timeout=3)
            QMessageBox.information(self, "OK", "Robot connection OK.")
        except Exception:
            QMessageBox.warning(self, "Fail", "Cannot read /joint_states.")

    def call_service(self, srv, label):
        try:
            out = subprocess.check_output(["rosservice","call",srv], stderr=subprocess.STDOUT)
            QMessageBox.information(self, f"{label} OK", out.decode())
        except Exception as e:
            QMessageBox.critical(self, f"{label} Fail", str(e))

    def go_home(self):
        if self.current_joint_states is None:
            QMessageBox.warning(self, "No Data", "No /joint_states data.")
            return
        try:
            dt = float(self.time_input.text())
        except ValueError:
            QMessageBox.warning(self, "Input Error", "Invalid time interval.")
            return
        # Publish initial position
        traj_init = JointTrajectory()
        traj_init.joint_names = ["joint_1_s","joint_2_l","joint_3_u","joint_4_r","joint_5_b","joint_6_t"]
        p0 = JointTrajectoryPoint()
        p0.positions = list(self.current_joint_states.position)
        p0.velocities = [0.0]*len(p0.positions)
        p0.time_from_start = rospy.Duration(0.0)
        traj_init.points = [p0]
        traj_init.header.stamp = rospy.Time.now()
        self.traj_pub.publish(traj_init)
        # small delay
        rospy.sleep(0.1)
        # Publish home position
        traj_home = JointTrajectory()
        traj_home.joint_names = traj_init.joint_names
        p1 = JointTrajectoryPoint()
        p1.positions = [0.0]*len(p0.positions)
        p1.velocities = [0.0]*len(p0.positions)
        p1.time_from_start = rospy.Duration(dt)
        traj_home.points = [p1]
        traj_home.header.stamp = rospy.Time.now()
        self.traj_pub.publish(traj_home)
        QMessageBox.information(self, "Go Home", f"Trajectory: current->home in {dt}s published.")

    def move_to_joint_angles(self):
        angles = []
        try:
            angles = [float(input.text()) for input in self.joint_inputs]
        except ValueError:
            QMessageBox.warning(self, "Input Error", "Invalid joint angle values.")
            return
        # Publish joint angles
        traj = JointTrajectory()
        traj.joint_names = ["joint_1_s","joint_2_l","joint_3_u","joint_4_r","joint_5_b","joint_6_t"]
        p = JointTrajectoryPoint()
        p.positions = angles
        p.velocities = [0.0]*len(angles)
        p.time_from_start = rospy.Duration(1.0)
        traj.points = [p]
        traj.header.stamp = rospy.Time.now()
        self.traj_pub.publish(traj)
        QMessageBox.information(self, "Moving", "Moving to desired joint angles.")

    def move_to_pose(self):
        pose = []
        try:
            pose = [float(input.text()) for input in self.pose_inputs]
        except ValueError:
            QMessageBox.warning(self, "Input Error", "Invalid pose values.")
            return
        # Publish pose (This is a placeholder for the actual pose conversion)
        # You can add conversion to a trajectory for your robot
        QMessageBox.information(self, "Moving", "Moving to desired pose.")

    def run_node(self, node_name, action):
        try:
            cmd = f"rosrun path_control {node_name}_{action}"
            subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            QMessageBox.information(self, f"{action.capitalize()} {node_name}",
                                    f"{action.capitalize()} {node_name} node is running.")
        except Exception as e:
            QMessageBox.critical(self, f"{action.capitalize()} {node_name} Fail", str(e))

    def closeEvent(self, event):
        if self.interface_process and self.interface_process.poll() is None:
            self.interface_process.terminate()
            self.interface_process.wait()
        event.accept()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    win = RobotLauncher()
    win.show()
    sys.exit(app.exec_())
