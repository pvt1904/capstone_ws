# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "manipulator_pose_following: 2 messages, 6 services")

set(MSG_I_FLAGS "-Imanipulator_pose_following:/home/tam/capstone_ws/src/manipulator_pose_following/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(manipulator_pose_following_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg" NAME_WE)
add_custom_target(_manipulator_pose_following_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_pose_following" "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg" ""
)

get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg" NAME_WE)
add_custom_target(_manipulator_pose_following_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_pose_following" "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg" ""
)

get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv" NAME_WE)
add_custom_target(_manipulator_pose_following_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_pose_following" "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv" ""
)

get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv" NAME_WE)
add_custom_target(_manipulator_pose_following_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_pose_following" "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv" ""
)

get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv" NAME_WE)
add_custom_target(_manipulator_pose_following_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_pose_following" "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv" ""
)

get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv" NAME_WE)
add_custom_target(_manipulator_pose_following_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_pose_following" "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv" ""
)

get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv" NAME_WE)
add_custom_target(_manipulator_pose_following_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_pose_following" "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv" ""
)

get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv" NAME_WE)
add_custom_target(_manipulator_pose_following_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "manipulator_pose_following" "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
)
_generate_msg_cpp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
)

### Generating Services
_generate_srv_cpp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_cpp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_cpp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_cpp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_cpp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_cpp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
)

### Generating Module File
_generate_module_cpp(manipulator_pose_following
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(manipulator_pose_following_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(manipulator_pose_following_generate_messages manipulator_pose_following_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_cpp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_cpp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_cpp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_cpp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_cpp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_cpp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_cpp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_cpp _manipulator_pose_following_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_pose_following_gencpp)
add_dependencies(manipulator_pose_following_gencpp manipulator_pose_following_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_pose_following_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
)
_generate_msg_eus(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
)

### Generating Services
_generate_srv_eus(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_eus(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_eus(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_eus(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_eus(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_eus(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
)

### Generating Module File
_generate_module_eus(manipulator_pose_following
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(manipulator_pose_following_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(manipulator_pose_following_generate_messages manipulator_pose_following_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_eus _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_eus _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_eus _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_eus _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_eus _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_eus _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_eus _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_eus _manipulator_pose_following_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_pose_following_geneus)
add_dependencies(manipulator_pose_following_geneus manipulator_pose_following_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_pose_following_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
)
_generate_msg_lisp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
)

### Generating Services
_generate_srv_lisp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_lisp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_lisp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_lisp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_lisp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_lisp(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
)

### Generating Module File
_generate_module_lisp(manipulator_pose_following
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(manipulator_pose_following_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(manipulator_pose_following_generate_messages manipulator_pose_following_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_lisp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_lisp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_lisp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_lisp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_lisp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_lisp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_lisp _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_lisp _manipulator_pose_following_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_pose_following_genlisp)
add_dependencies(manipulator_pose_following_genlisp manipulator_pose_following_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_pose_following_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
)
_generate_msg_nodejs(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
)

### Generating Services
_generate_srv_nodejs(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_nodejs(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_nodejs(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_nodejs(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_nodejs(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_nodejs(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
)

### Generating Module File
_generate_module_nodejs(manipulator_pose_following
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(manipulator_pose_following_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(manipulator_pose_following_generate_messages manipulator_pose_following_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_nodejs _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_nodejs _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_nodejs _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_nodejs _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_nodejs _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_nodejs _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_nodejs _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_nodejs _manipulator_pose_following_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_pose_following_gennodejs)
add_dependencies(manipulator_pose_following_gennodejs manipulator_pose_following_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_pose_following_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
)
_generate_msg_py(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
)

### Generating Services
_generate_srv_py(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_py(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_py(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_py(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_py(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
)
_generate_srv_py(manipulator_pose_following
  "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
)

### Generating Module File
_generate_module_py(manipulator_pose_following
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(manipulator_pose_following_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(manipulator_pose_following_generate_messages manipulator_pose_following_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/DeltaPoseRPY.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_py _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/msg/PlannedPath.msg" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_py _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/InitPoint.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_py _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveHome.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_py _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToRPY.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_py _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/MoveToQuat.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_py _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/ReplyInt.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_py _manipulator_pose_following_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/manipulator_pose_following/srv/SetVelocity.srv" NAME_WE)
add_dependencies(manipulator_pose_following_generate_messages_py _manipulator_pose_following_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(manipulator_pose_following_genpy)
add_dependencies(manipulator_pose_following_genpy manipulator_pose_following_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS manipulator_pose_following_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/manipulator_pose_following
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(manipulator_pose_following_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/manipulator_pose_following
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(manipulator_pose_following_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/manipulator_pose_following
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(manipulator_pose_following_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/manipulator_pose_following
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(manipulator_pose_following_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/manipulator_pose_following
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(manipulator_pose_following_generate_messages_py std_msgs_generate_messages_py)
endif()
