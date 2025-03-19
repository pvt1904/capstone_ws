#include <ros/ros.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Float64MultiArray.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

std::vector<double> q;
std::vector<std::string> q_name = {"joint_1_s", "joint_2_l", "joint_3_u", "joint_4_r", "joint_5_b", "joint_6_t"};

class ControlLoop {
public:
    ControlLoop(ros::NodeHandle& nh) : robot_model_loader_("robot_description") {
        joint_state_sub_ = nh.subscribe("/desired_point", 10, &ControlLoop::desiredPointCallback, this);
        robot_model_ = robot_model_loader_.getModel();
        robot_state_ = std::make_shared<robot_state::RobotState>(robot_model_);
    }

    void desiredPointCallback(const std_msgs::Float64MultiArray& msg) {
        int iters = 10;
        float tol = 0.01;
        float damp = 0.5;
        bool success = false;

        Eigen::Vector3d desired_position(msg.data[0], msg.data[1], msg.data[2]);
        Eigen::Matrix3d desired_rotation;
        desired_rotation = Eigen::AngleAxisd(msg.data[3], Eigen::Vector3d::UnitZ()) *
                            Eigen::AngleAxisd(msg.data[4], Eigen::Vector3d::UnitY()) *
                            Eigen::AngleAxisd(msg.data[5], Eigen::Vector3d::UnitX());
        
        if (!robot_model_) {
            ROS_ERROR("Robot model not loaded.");
            return;
        }
        
        const robot_state::JointModelGroup* joint_model_group = robot_model_->getJointModelGroup("arm");
        if (!joint_model_group) {
            ROS_ERROR("Planning group 'arm' not found!");
            return;
        }
        
        for (int i = 0; i < iters; i++)
        {
            // Forward Kinetics, get position and orientation
            robot_state_->setVariablePositions(q_name, q);
            robot_state_->update();
            const Eigen::Isometry3d& end_effector_state = robot_state_->getGlobalLinkTransform("link_6_t");
            
            // Calculate error     
            Eigen::Vector3d current_position = end_effector_state.translation();
            Eigen::Matrix3d error_rotation = desired_rotation - end_effector_state.rotation();
            
            Eigen::VectorXd error(6);
            error.head(3) = desired_position - current_position;  // First 3 elements → Position error
            error.tail(3) = error_rotation.eulerAngles(0, 1, 2);  

            // Check error condition
            if (error.norm() < tol) {
                success = true;
                break;
            }

            // Calculate Damped Least Square formula
            robot_state_->setVariablePositions(q_name, q);
            robot_state_->update();

            Eigen::MatrixXd jacobian;
            Eigen::Vector3d reference_point_position(0.0, 0.0, 0.0);
            robot_state_->getJacobian(
                joint_model_group,
                robot_state_->getLinkModel(joint_model_group->getLinkModelNames().back()),
                reference_point_position,
                jacobian
            );

            Eigen::VectorXd dq = jacobian.transpose() * (jacobian * jacobian.transpose() + damp * damp * Eigen::MatrixXd::Identity(6, 6)).inverse() * error;
            std::vector<double> dq_vector(dq.data(), dq.data() + dq.size());
            for (int i = 0; i < q.size(); i++) {
                q[i] += dq_vector[i];
            }
            
            // Update to joint_command
        }        
    }

private:
    ros::Subscriber joint_state_sub_;
    robot_model_loader::RobotModelLoader robot_model_loader_;
    robot_model::RobotModelPtr robot_model_;
    robot_state::RobotStatePtr robot_state_;
};

void jointStatesCallback(const sensor_msgs::JointState::ConstPtr& msg) {
    q = msg->position;
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "jacobian_calculator");
    ros::NodeHandle nh;
    ros::AsyncSpinner spinner(1);
    spinner.start();
    ControlLoop cl(nh);

    ros::Subscriber joint_states_sub = nh.subscribe("/joint_states", 10, jointStatesCallback);
    ros::waitForShutdown();
    return 0;
}