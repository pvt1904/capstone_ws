;; Auto-generated. Do not edit!


(when (boundp 'path_control::MoveToFirstPosition)
  (if (not (find-package "PATH_CONTROL"))
    (make-package "PATH_CONTROL"))
  (shadow 'MoveToFirstPosition (find-package "PATH_CONTROL")))
(unless (find-package "PATH_CONTROL::MOVETOFIRSTPOSITION")
  (make-package "PATH_CONTROL::MOVETOFIRSTPOSITION"))
(unless (find-package "PATH_CONTROL::MOVETOFIRSTPOSITIONREQUEST")
  (make-package "PATH_CONTROL::MOVETOFIRSTPOSITIONREQUEST"))
(unless (find-package "PATH_CONTROL::MOVETOFIRSTPOSITIONRESPONSE")
  (make-package "PATH_CONTROL::MOVETOFIRSTPOSITIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass path_control::MoveToFirstPositionRequest
  :super ros::object
  :slots (_target_state ))

(defmethod path_control::MoveToFirstPositionRequest
  (:init
   (&key
    ((:target_state __target_state) (instance sensor_msgs::JointState :init))
    )
   (send-super :init)
   (setq _target_state __target_state)
   self)
  (:target_state
   (&rest __target_state)
   (if (keywordp (car __target_state))
       (send* _target_state __target_state)
     (progn
       (if __target_state (setq _target_state (car __target_state)))
       _target_state)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/JointState _target_state
    (send _target_state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/JointState _target_state
       (send _target_state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/JointState _target_state
     (send _target_state :deserialize buf ptr-) (incf ptr- (send _target_state :serialization-length))
   ;;
   self)
  )

(defclass path_control::MoveToFirstPositionResponse
  :super ros::object
  :slots (_reached ))

(defmethod path_control::MoveToFirstPositionResponse
  (:init
   (&key
    ((:reached __reached) nil)
    )
   (send-super :init)
   (setq _reached __reached)
   self)
  (:reached
   (&optional (__reached :null))
   (if (not (eq __reached :null)) (setq _reached __reached)) _reached)
  (:serialization-length
   ()
   (+
    ;; bool _reached
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reached
       (if _reached (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reached
     (setq _reached (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass path_control::MoveToFirstPosition
  :super ros::object
  :slots ())

(setf (get path_control::MoveToFirstPosition :md5sum-) "4b55fa8d67c0f416a417d03da8d3ff7f")
(setf (get path_control::MoveToFirstPosition :datatype-) "path_control/MoveToFirstPosition")
(setf (get path_control::MoveToFirstPosition :request) path_control::MoveToFirstPositionRequest)
(setf (get path_control::MoveToFirstPosition :response) path_control::MoveToFirstPositionResponse)

(defmethod path_control::MoveToFirstPositionRequest
  (:response () (instance path_control::MoveToFirstPositionResponse :init)))

(setf (get path_control::MoveToFirstPositionRequest :md5sum-) "4b55fa8d67c0f416a417d03da8d3ff7f")
(setf (get path_control::MoveToFirstPositionRequest :datatype-) "path_control/MoveToFirstPositionRequest")
(setf (get path_control::MoveToFirstPositionRequest :definition-)
      "sensor_msgs/JointState target_state

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
bool reached

")

(setf (get path_control::MoveToFirstPositionResponse :md5sum-) "4b55fa8d67c0f416a417d03da8d3ff7f")
(setf (get path_control::MoveToFirstPositionResponse :datatype-) "path_control/MoveToFirstPositionResponse")
(setf (get path_control::MoveToFirstPositionResponse :definition-)
      "sensor_msgs/JointState target_state

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id
---
bool reached

")



(provide :path_control/MoveToFirstPosition "4b55fa8d67c0f416a417d03da8d3ff7f")


