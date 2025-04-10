import sys
import subprocess
from PyQt5.QtWidgets import (
    QApplication, QWidget, QLabel, QLineEdit, QPushButton,
    QVBoxLayout, QHBoxLayout, QMessageBox, QGroupBox
)

class RobotLauncher(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Motoman Robot Launcher")
        self.init_ui()

    def init_ui(self):
        main_layout = QVBoxLayout()

        # Group box for connection settings
        conn_group = QGroupBox("Connection")
        conn_layout = QVBoxLayout()

        # Robot IP input
        ip_layout = QHBoxLayout()
        ip_label = QLabel("Robot IP:")
        self.ip_input = QLineEdit()
        ip_layout.addWidget(ip_label)
        ip_layout.addWidget(self.ip_input)
        conn_layout.addLayout(ip_layout)

        # Controller input
        ctrl_layout = QHBoxLayout()
        ctrl_label = QLabel("Controller:")
        self.ctrl_input = QLineEdit()
        self.ctrl_input.setText("yrc1000")
        ctrl_layout.addWidget(ctrl_label)
        ctrl_layout.addWidget(self.ctrl_input)
        conn_layout.addLayout(ctrl_layout)

        # Launch robot interface button
        self.launch_interface_btn = QPushButton("Launch Robot Interface")
        self.launch_interface_btn.clicked.connect(self.launch_interface)
        conn_layout.addWidget(self.launch_interface_btn)

        # Launch demo button
        self.launch_demo_btn = QPushButton("Launch Demo")
        self.launch_demo_btn.clicked.connect(self.launch_demo)
        conn_layout.addWidget(self.launch_demo_btn)

        # Check connection button
        self.check_conn_btn = QPushButton("Check Robot Connection")
        self.check_conn_btn.clicked.connect(self.check_connection)
        conn_layout.addWidget(self.check_conn_btn)

        conn_group.setLayout(conn_layout)
        main_layout.addWidget(conn_group)

        self.setLayout(main_layout)

    def launch_interface(self):
        ip = self.ip_input.text().strip()
        ctrl = self.ctrl_input.text().strip()

        if not ip or not ctrl:
            QMessageBox.warning(self, "Input Error", "Please enter both IP and controller.")
            return

        try:
            cmd = f"roslaunch motoman_motomini_support robot_interface_streaming_motomini.launch controller:={ctrl} robot_ip:={ip}"
            subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            QMessageBox.information(self, "Launching", "Robot Interface is launching in background...")
        except Exception as e:
            QMessageBox.critical(self, "Launch Failed", str(e))

    def launch_demo(self):
        try:
            cmd = "roslaunch motomini demo.launch"
            subprocess.Popen(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            QMessageBox.information(self, "Launching", "Demo is launching in background...")
        except Exception as e:
            QMessageBox.critical(self, "Launch Failed", str(e))

    def check_connection(self):
        try:
            output = subprocess.check_output(
                ["rostopic", "echo", "-n1", "/joint_states"],
                stderr=subprocess.STDOUT,
                timeout=3
            )
            QMessageBox.information(self, "Connection Status", "✅ Robot connection established.")
        except subprocess.TimeoutExpired:
            QMessageBox.warning(self, "Connection Timeout", "❌ No response from /joint_states.")
        except subprocess.CalledProcessError as e:
            QMessageBox.critical(self, "Connection Failed", f"Error:\n{e.output.decode()}")
        except FileNotFoundError:
            QMessageBox.critical(self, "ROS Not Found", "ROS environment not sourced.")


if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = RobotLauncher()
    window.show()
    sys.exit(app.exec_())
