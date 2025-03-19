#include <ros/ros.h>
#include <moveit/robot_model_loader/robot_model_loader.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>

int main(int argc, char** argv) {
    ros::init(argc, argv, "jacobian_computation");
    ros::AsyncSpinner spinner(1);
    spinner.start();

    // Load the robot model
    robot_model_loader::RobotModelLoader robot_model_loader("robot_description");
    robot_model::RobotModelPtr kinematic_model = robot_model_loader.getModel();
    ROS_INFO("Model frame: %s", kinematic_model->getModelFrame().c_str());

    // Create a RobotState and set it to default values
    robot_state::RobotStatePtr kinematic_state(new robot_state::RobotState(kinematic_model));
    kinematic_state->setToDefaultValues();

    // Specify your planniROS_INFO("Model frame: %s", kinematic_model->getModelFrame().c_str());ng group
    const robot_state::JointModelGroup* joint_model_group = kinematic_model->getJointModelGroup("arm");
    if (!joint_model_group) {
        ROS_ERROR("Planning group 'manipulator' not found!");
        return 1;
    }

    // Print joint names
    const std::vector<std::string>& joint_names = joint_model_group->getVariableNames();
    for (const auto& name : joint_names) {
        ROS_INFO("Joint name: %s", name.c_str());
    }

    // Get Joint Values
    // ^^^^^^^^^^^^^^^^
    //kinematic_state->setToRandomPositions(joint_model_group);
    std::vector<double> joint_values;
    kinematic_state->copyJointGroupPositions(joint_model_group, joint_values);
    for (std::size_t i = 0; i < joint_names.size(); ++i)
    {
        ROS_INFO("Joint %s: %f", joint_names[i].c_str(), joint_values[i]);
    }

    // Forward Kinematics
    // ^^^^^^^^^^^^^^^^
    const Eigen::Isometry3d& end_effector_state = kinematic_state->getGlobalLinkTransform("link_6_t");

    /* Print end-effector pose. Remember that this is in the model frame */
    ROS_INFO_STREAM("Isometry: \n" << end_effector_state.data() << "\n");
    ROS_INFO_STREAM("Translation: \n" << end_effector_state.translation() << "\n");
    ROS_INFO_STREAM("Rotation: \n" << end_effector_state.rotation() << "\n");

    // Inverse Kinematics
    // ^^^^^^^^^^^^^^^^^^

    std::size_t attempts = 10;
    double timeout = 0.1;
    bool found_ik = kinematic_state->setFromIK(joint_model_group, end_effector_state, attempts, timeout);

    // Now, we can print out the IK solution (if found):
    if (found_ik)
    {
        kinematic_state->copyJointGroupPositions(joint_model_group, joint_values);
        for (std::size_t i = 0; i < joint_names.size(); ++i)
        {
            ROS_INFO("Joint %s: %f", joint_names[i].c_str(), joint_values[i]);
        }
    }
    else
    {
        ROS_INFO("Did not find IK solution");
    }


    // Get the Jacobian
    Eigen::Vector3d reference_point_position(0.0, 0.0, 0.0); // Reference point relative to the end-effector
    Eigen::MatrixXd jacobian;
    bool success = kinematic_state->getJacobian(
        joint_model_group,
        kinematic_state->getLinkModel(joint_model_group->getLinkModelNames().back()),
        reference_point_position,
        jacobian,
        false
    );

    if (success) {
        ROS_INFO_STREAM("Jacobian matrix: \n" << jacobian << "\n");
    } else {
        ROS_ERROR("Failed to compute Jacobian.");
    }
    
    success = kinematic_state->getJacobian(
        joint_model_group,
        kinematic_state->getLinkModel(joint_model_group->getLinkModelNames().back()),
        reference_point_position,
        jacobian,
        true
    );

    if (success) {
        ROS_INFO_STREAM("Jacobian matrix with quaternion: \n" << jacobian << "\n");
    } else {
        ROS_ERROR("Failed to compute Jacobian.");
    }
   
    return 0;
}
