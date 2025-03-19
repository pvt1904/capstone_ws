# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "path_control: 2 messages, 2 services")

set(MSG_I_FLAGS "-Ipath_control:/home/tam/capstone_ws/src/path_control/msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(path_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg" NAME_WE)
add_custom_target(_path_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_control" "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg" "std_msgs/Header:geometry_msgs/Quaternion:sensor_msgs/JointState:geometry_msgs/Point"
)

get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg" NAME_WE)
add_custom_target(_path_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_control" "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg" ""
)

get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv" NAME_WE)
add_custom_target(_path_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_control" "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv" "std_msgs/Header:sensor_msgs/JointState"
)

get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv" NAME_WE)
add_custom_target(_path_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "path_control" "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(path_control
  "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_control
)
_generate_msg_cpp(path_control
  "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_control
)

### Generating Services
_generate_srv_cpp(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_control
)
_generate_srv_cpp(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_control
)

### Generating Module File
_generate_module_cpp(path_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(path_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(path_control_generate_messages path_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg" NAME_WE)
add_dependencies(path_control_generate_messages_cpp _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg" NAME_WE)
add_dependencies(path_control_generate_messages_cpp _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_cpp _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_cpp _path_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_control_gencpp)
add_dependencies(path_control_gencpp path_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_control_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(path_control
  "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_control
)
_generate_msg_eus(path_control
  "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_control
)

### Generating Services
_generate_srv_eus(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_control
)
_generate_srv_eus(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_control
)

### Generating Module File
_generate_module_eus(path_control
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_control
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(path_control_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(path_control_generate_messages path_control_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg" NAME_WE)
add_dependencies(path_control_generate_messages_eus _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg" NAME_WE)
add_dependencies(path_control_generate_messages_eus _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_eus _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_eus _path_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_control_geneus)
add_dependencies(path_control_geneus path_control_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_control_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(path_control
  "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_control
)
_generate_msg_lisp(path_control
  "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_control
)

### Generating Services
_generate_srv_lisp(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_control
)
_generate_srv_lisp(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_control
)

### Generating Module File
_generate_module_lisp(path_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(path_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(path_control_generate_messages path_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg" NAME_WE)
add_dependencies(path_control_generate_messages_lisp _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg" NAME_WE)
add_dependencies(path_control_generate_messages_lisp _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_lisp _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_lisp _path_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_control_genlisp)
add_dependencies(path_control_genlisp path_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_control_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(path_control
  "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_control
)
_generate_msg_nodejs(path_control
  "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_control
)

### Generating Services
_generate_srv_nodejs(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_control
)
_generate_srv_nodejs(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_control
)

### Generating Module File
_generate_module_nodejs(path_control
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_control
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(path_control_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(path_control_generate_messages path_control_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg" NAME_WE)
add_dependencies(path_control_generate_messages_nodejs _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg" NAME_WE)
add_dependencies(path_control_generate_messages_nodejs _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_nodejs _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_nodejs _path_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_control_gennodejs)
add_dependencies(path_control_gennodejs path_control_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_control_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(path_control
  "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_control
)
_generate_msg_py(path_control
  "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_control
)

### Generating Services
_generate_srv_py(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_control
)
_generate_srv_py(path_control
  "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_control
)

### Generating Module File
_generate_module_py(path_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(path_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(path_control_generate_messages path_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/EndEffectorState.msg" NAME_WE)
add_dependencies(path_control_generate_messages_py _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/msg/ControllMsg.msg" NAME_WE)
add_dependencies(path_control_generate_messages_py _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToFirstPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_py _path_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/tam/capstone_ws/src/path_control/srv/MoveToPosition.srv" NAME_WE)
add_dependencies(path_control_generate_messages_py _path_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(path_control_genpy)
add_dependencies(path_control_genpy path_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS path_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/path_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(path_control_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(path_control_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(path_control_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/path_control
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(path_control_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(path_control_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(path_control_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/path_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(path_control_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(path_control_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(path_control_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/path_control
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(path_control_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(path_control_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(path_control_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/path_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(path_control_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(path_control_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(path_control_generate_messages_py geometry_msgs_generate_messages_py)
endif()
