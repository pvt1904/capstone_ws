cmake_minimum_required(VERSION 3.0.2)
project(plot_bag_data)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
  rospy
  sensor_msgs
  std_msgs
)

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)

## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## Generate messages, services, or actions if needed (uncomment if required)
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

# generate_messages(
#   DEPENDENCIES
#   sensor_msgs
#   std_msgs
# )

################################################
## catkin specific configuration ##
##########################################
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES plot_bag_data
#  CATKIN_DEPENDS rospy sensor_msgs std_msgs
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
include_directories(
  ${catkin_INCLUDE_DIRS}
)

## Declare Python node for installation
catkin_install_python(PROGRAMS
  scripts/sine_wave_pub.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

#############
## Testing ##
#############

## Add testing if needed
# catkin_add_gtest(${PROJECT_NAME}-test test/test_plot_bag_data.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)
