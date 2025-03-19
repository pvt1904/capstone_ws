; Auto-generated. Do not edit!


(cl:in-package path_control-srv)


;//! \htmlinclude MoveToFirstPosition-request.msg.html

(cl:defclass <MoveToFirstPosition-request> (roslisp-msg-protocol:ros-message)
  ((target_state
    :reader target_state
    :initarg :target_state
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState)))
)

(cl:defclass MoveToFirstPosition-request (<MoveToFirstPosition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToFirstPosition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToFirstPosition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_control-srv:<MoveToFirstPosition-request> is deprecated: use path_control-srv:MoveToFirstPosition-request instead.")))

(cl:ensure-generic-function 'target_state-val :lambda-list '(m))
(cl:defmethod target_state-val ((m <MoveToFirstPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_control-srv:target_state-val is deprecated.  Use path_control-srv:target_state instead.")
  (target_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToFirstPosition-request>) ostream)
  "Serializes a message object of type '<MoveToFirstPosition-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'target_state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToFirstPosition-request>) istream)
  "Deserializes a message object of type '<MoveToFirstPosition-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'target_state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToFirstPosition-request>)))
  "Returns string type for a service object of type '<MoveToFirstPosition-request>"
  "path_control/MoveToFirstPositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToFirstPosition-request)))
  "Returns string type for a service object of type 'MoveToFirstPosition-request"
  "path_control/MoveToFirstPositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToFirstPosition-request>)))
  "Returns md5sum for a message object of type '<MoveToFirstPosition-request>"
  "4b55fa8d67c0f416a417d03da8d3ff7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToFirstPosition-request)))
  "Returns md5sum for a message object of type 'MoveToFirstPosition-request"
  "4b55fa8d67c0f416a417d03da8d3ff7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToFirstPosition-request>)))
  "Returns full string definition for message of type '<MoveToFirstPosition-request>"
  (cl:format cl:nil "sensor_msgs/JointState target_state~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToFirstPosition-request)))
  "Returns full string definition for message of type 'MoveToFirstPosition-request"
  (cl:format cl:nil "sensor_msgs/JointState target_state~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToFirstPosition-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'target_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToFirstPosition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToFirstPosition-request
    (cl:cons ':target_state (target_state msg))
))
;//! \htmlinclude MoveToFirstPosition-response.msg.html

(cl:defclass <MoveToFirstPosition-response> (roslisp-msg-protocol:ros-message)
  ((reached
    :reader reached
    :initarg :reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MoveToFirstPosition-response (<MoveToFirstPosition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToFirstPosition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToFirstPosition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_control-srv:<MoveToFirstPosition-response> is deprecated: use path_control-srv:MoveToFirstPosition-response instead.")))

(cl:ensure-generic-function 'reached-val :lambda-list '(m))
(cl:defmethod reached-val ((m <MoveToFirstPosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_control-srv:reached-val is deprecated.  Use path_control-srv:reached instead.")
  (reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToFirstPosition-response>) ostream)
  "Serializes a message object of type '<MoveToFirstPosition-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToFirstPosition-response>) istream)
  "Deserializes a message object of type '<MoveToFirstPosition-response>"
    (cl:setf (cl:slot-value msg 'reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToFirstPosition-response>)))
  "Returns string type for a service object of type '<MoveToFirstPosition-response>"
  "path_control/MoveToFirstPositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToFirstPosition-response)))
  "Returns string type for a service object of type 'MoveToFirstPosition-response"
  "path_control/MoveToFirstPositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToFirstPosition-response>)))
  "Returns md5sum for a message object of type '<MoveToFirstPosition-response>"
  "4b55fa8d67c0f416a417d03da8d3ff7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToFirstPosition-response)))
  "Returns md5sum for a message object of type 'MoveToFirstPosition-response"
  "4b55fa8d67c0f416a417d03da8d3ff7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToFirstPosition-response>)))
  "Returns full string definition for message of type '<MoveToFirstPosition-response>"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToFirstPosition-response)))
  "Returns full string definition for message of type 'MoveToFirstPosition-response"
  (cl:format cl:nil "bool reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToFirstPosition-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToFirstPosition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToFirstPosition-response
    (cl:cons ':reached (reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveToFirstPosition)))
  'MoveToFirstPosition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveToFirstPosition)))
  'MoveToFirstPosition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToFirstPosition)))
  "Returns string type for a service object of type '<MoveToFirstPosition>"
  "path_control/MoveToFirstPosition")