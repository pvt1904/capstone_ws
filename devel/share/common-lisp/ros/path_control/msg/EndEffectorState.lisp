; Auto-generated. Do not edit!


(cl:in-package path_control-msg)


;//! \htmlinclude EndEffectorState.msg.html

(cl:defclass <EndEffectorState> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (orientation
    :reader orientation
    :initarg :orientation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (joint
    :reader joint
    :initarg :joint
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState)))
)

(cl:defclass EndEffectorState (<EndEffectorState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EndEffectorState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EndEffectorState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_control-msg:<EndEffectorState> is deprecated: use path_control-msg:EndEffectorState instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <EndEffectorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_control-msg:position-val is deprecated.  Use path_control-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <EndEffectorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_control-msg:orientation-val is deprecated.  Use path_control-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'joint-val :lambda-list '(m))
(cl:defmethod joint-val ((m <EndEffectorState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_control-msg:joint-val is deprecated.  Use path_control-msg:joint instead.")
  (joint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EndEffectorState>) ostream)
  "Serializes a message object of type '<EndEffectorState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EndEffectorState>) istream)
  "Deserializes a message object of type '<EndEffectorState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EndEffectorState>)))
  "Returns string type for a message object of type '<EndEffectorState>"
  "path_control/EndEffectorState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EndEffectorState)))
  "Returns string type for a message object of type 'EndEffectorState"
  "path_control/EndEffectorState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EndEffectorState>)))
  "Returns md5sum for a message object of type '<EndEffectorState>"
  "40115f38ef3079bbc7172e457d79d145")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EndEffectorState)))
  "Returns md5sum for a message object of type 'EndEffectorState"
  "40115f38ef3079bbc7172e457d79d145")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EndEffectorState>)))
  "Returns full string definition for message of type '<EndEffectorState>"
  (cl:format cl:nil "geometry_msgs/Point position   # x, y, z~%geometry_msgs/Quaternion orientation  # w, x, y, z~%sensor_msgs/JointState joint~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EndEffectorState)))
  "Returns full string definition for message of type 'EndEffectorState"
  (cl:format cl:nil "geometry_msgs/Point position   # x, y, z~%geometry_msgs/Quaternion orientation  # w, x, y, z~%sensor_msgs/JointState joint~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EndEffectorState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EndEffectorState>))
  "Converts a ROS message object to a list"
  (cl:list 'EndEffectorState
    (cl:cons ':position (position msg))
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':joint (joint msg))
))
