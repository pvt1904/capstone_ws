; Auto-generated. Do not edit!


(cl:in-package manipulator_pose_following-srv)


;//! \htmlinclude MoveHome-request.msg.html

(cl:defclass <MoveHome-request> (roslisp-msg-protocol:ros-message)
  ((max_vel_fact
    :reader max_vel_fact
    :initarg :max_vel_fact
    :type cl:float
    :initform 0.0)
   (max_acc_fact
    :reader max_acc_fact
    :initarg :max_acc_fact
    :type cl:float
    :initform 0.0))
)

(cl:defclass MoveHome-request (<MoveHome-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveHome-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveHome-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<MoveHome-request> is deprecated: use manipulator_pose_following-srv:MoveHome-request instead.")))

(cl:ensure-generic-function 'max_vel_fact-val :lambda-list '(m))
(cl:defmethod max_vel_fact-val ((m <MoveHome-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:max_vel_fact-val is deprecated.  Use manipulator_pose_following-srv:max_vel_fact instead.")
  (max_vel_fact m))

(cl:ensure-generic-function 'max_acc_fact-val :lambda-list '(m))
(cl:defmethod max_acc_fact-val ((m <MoveHome-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:max_acc_fact-val is deprecated.  Use manipulator_pose_following-srv:max_acc_fact instead.")
  (max_acc_fact m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveHome-request>) ostream)
  "Serializes a message object of type '<MoveHome-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_vel_fact))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_acc_fact))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveHome-request>) istream)
  "Deserializes a message object of type '<MoveHome-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_vel_fact) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_acc_fact) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveHome-request>)))
  "Returns string type for a service object of type '<MoveHome-request>"
  "manipulator_pose_following/MoveHomeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveHome-request)))
  "Returns string type for a service object of type 'MoveHome-request"
  "manipulator_pose_following/MoveHomeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveHome-request>)))
  "Returns md5sum for a message object of type '<MoveHome-request>"
  "2b1a8682c27b5174f22f80c985fc7be9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveHome-request)))
  "Returns md5sum for a message object of type 'MoveHome-request"
  "2b1a8682c27b5174f22f80c985fc7be9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveHome-request>)))
  "Returns full string definition for message of type '<MoveHome-request>"
  (cl:format cl:nil "float32 max_vel_fact~%float32 max_acc_fact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveHome-request)))
  "Returns full string definition for message of type 'MoveHome-request"
  (cl:format cl:nil "float32 max_vel_fact~%float32 max_acc_fact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveHome-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveHome-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveHome-request
    (cl:cons ':max_vel_fact (max_vel_fact msg))
    (cl:cons ':max_acc_fact (max_acc_fact msg))
))
;//! \htmlinclude MoveHome-response.msg.html

(cl:defclass <MoveHome-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveHome-response (<MoveHome-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveHome-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveHome-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<MoveHome-response> is deprecated: use manipulator_pose_following-srv:MoveHome-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <MoveHome-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:reply-val is deprecated.  Use manipulator_pose_following-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveHome-response>) ostream)
  "Serializes a message object of type '<MoveHome-response>"
  (cl:let* ((signed (cl:slot-value msg 'reply)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveHome-response>) istream)
  "Deserializes a message object of type '<MoveHome-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reply) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveHome-response>)))
  "Returns string type for a service object of type '<MoveHome-response>"
  "manipulator_pose_following/MoveHomeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveHome-response)))
  "Returns string type for a service object of type 'MoveHome-response"
  "manipulator_pose_following/MoveHomeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveHome-response>)))
  "Returns md5sum for a message object of type '<MoveHome-response>"
  "2b1a8682c27b5174f22f80c985fc7be9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveHome-response)))
  "Returns md5sum for a message object of type 'MoveHome-response"
  "2b1a8682c27b5174f22f80c985fc7be9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveHome-response>)))
  "Returns full string definition for message of type '<MoveHome-response>"
  (cl:format cl:nil "int32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveHome-response)))
  "Returns full string definition for message of type 'MoveHome-response"
  (cl:format cl:nil "int32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveHome-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveHome-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveHome-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveHome)))
  'MoveHome-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveHome)))
  'MoveHome-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveHome)))
  "Returns string type for a service object of type '<MoveHome>"
  "manipulator_pose_following/MoveHome")