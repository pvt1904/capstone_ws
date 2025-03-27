# 6DOF Yaskawa Hand Movement Trajectory Tracking Control

## Project Overview
This project demonstrates real-time **hand movement trajectory tracking** using a **6DOF Yaskawa industrial robot arm**. The system utilizes **Leap Motion** and **MPU6050 IMU** sensors to capture hand motion and map it to the robot's movements. The project is implemented using **ROS 2** for sensor data processing and **ROS 1** for robot control, with `ros1_bridge` enabling communication between both frameworks.

## Features
- **Real-time hand movement tracking** using Leap Motion & MPU6050 IMU
- **ROS 1 & ROS 2 integration** via `ros1_bridge`
- **Damped Least Squares Inverse Kinematics** for smooth trajectory tracking
- **Ethernet/WiFi-based control** for remote operation
- **Capstone Project Implementation** with real-world industrial applications

## System Architecture

This diagram illustrates the system architecture for hand movement trajectory tracking control:

![System Architecture Diagram](https://github.com/pvt1904/capstone_ws/blob/main/system%20architecture%20diagram.png)

## Demo Video 

[Watch the demo here](https://www.youtube.com/watch?v=uGlPf27Kfro)
