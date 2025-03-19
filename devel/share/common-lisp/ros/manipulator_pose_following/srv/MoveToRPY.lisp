; Auto-generated. Do not edit!


(cl:in-package manipulator_pose_following-srv)


;//! \htmlinclude MoveToRPY-request.msg.html

(cl:defclass <MoveToRPY-request> (roslisp-msg-protocol:ros-message)
  ((pose_rpy
    :reader pose_rpy
    :initarg :pose_rpy
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (max_vel_fact
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

(cl:defclass MoveToRPY-request (<MoveToRPY-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToRPY-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToRPY-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<MoveToRPY-request> is deprecated: use manipulator_pose_following-srv:MoveToRPY-request instead.")))

(cl:ensure-generic-function 'pose_rpy-val :lambda-list '(m))
(cl:defmethod pose_rpy-val ((m <MoveToRPY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:pose_rpy-val is deprecated.  Use manipulator_pose_following-srv:pose_rpy instead.")
  (pose_rpy m))

(cl:ensure-generic-function 'max_vel_fact-val :lambda-list '(m))
(cl:defmethod max_vel_fact-val ((m <MoveToRPY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:max_vel_fact-val is deprecated.  Use manipulator_pose_following-srv:max_vel_fact instead.")
  (max_vel_fact m))

(cl:ensure-generic-function 'max_acc_fact-val :lambda-list '(m))
(cl:defmethod max_acc_fact-val ((m <MoveToRPY-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:max_acc_fact-val is deprecated.  Use manipulator_pose_following-srv:max_acc_fact instead.")
  (max_acc_fact m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToRPY-request>) ostream)
  "Serializes a message object of type '<MoveToRPY-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose_rpy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pose_rpy))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToRPY-request>) istream)
  "Deserializes a message object of type '<MoveToRPY-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose_rpy) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose_rpy)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToRPY-request>)))
  "Returns string type for a service object of type '<MoveToRPY-request>"
  "manipulator_pose_following/MoveToRPYRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToRPY-request)))
  "Returns string type for a service object of type 'MoveToRPY-request"
  "manipulator_pose_following/MoveToRPYRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToRPY-request>)))
  "Returns md5sum for a message object of type '<MoveToRPY-request>"
  "a228832e898673e8095d7a0ddc0283a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToRPY-request)))
  "Returns md5sum for a message object of type 'MoveToRPY-request"
  "a228832e898673e8095d7a0ddc0283a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToRPY-request>)))
  "Returns full string definition for message of type '<MoveToRPY-request>"
  (cl:format cl:nil "float32[] pose_rpy~%float32   max_vel_fact~%float32   max_acc_fact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToRPY-request)))
  "Returns full string definition for message of type 'MoveToRPY-request"
  (cl:format cl:nil "float32[] pose_rpy~%float32   max_vel_fact~%float32   max_acc_fact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToRPY-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose_rpy) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToRPY-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToRPY-request
    (cl:cons ':pose_rpy (pose_rpy msg))
    (cl:cons ':max_vel_fact (max_vel_fact msg))
    (cl:cons ':max_acc_fact (max_acc_fact msg))
))
;//! \htmlinclude MoveToRPY-response.msg.html

(cl:defclass <MoveToRPY-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveToRPY-response (<MoveToRPY-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToRPY-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToRPY-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<MoveToRPY-response> is deprecated: use manipulator_pose_following-srv:MoveToRPY-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <MoveToRPY-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:reply-val is deprecated.  Use manipulator_pose_following-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToRPY-response>) ostream)
  "Serializes a message object of type '<MoveToRPY-response>"
  (cl:let* ((signed (cl:slot-value msg 'reply)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToRPY-response>) istream)
  "Deserializes a message object of type '<MoveToRPY-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reply) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToRPY-response>)))
  "Returns string type for a service object of type '<MoveToRPY-response>"
  "manipulator_pose_following/MoveToRPYResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToRPY-response)))
  "Returns string type for a service object of type 'MoveToRPY-response"
  "manipulator_pose_following/MoveToRPYResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToRPY-response>)))
  "Returns md5sum for a message object of type '<MoveToRPY-response>"
  "a228832e898673e8095d7a0ddc0283a1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToRPY-response)))
  "Returns md5sum for a message object of type 'MoveToRPY-response"
  "a228832e898673e8095d7a0ddc0283a1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToRPY-response>)))
  "Returns full string definition for message of type '<MoveToRPY-response>"
  (cl:format cl:nil "int32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToRPY-response)))
  "Returns full string definition for message of type 'MoveToRPY-response"
  (cl:format cl:nil "int32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToRPY-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToRPY-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToRPY-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveToRPY)))
  'MoveToRPY-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveToRPY)))
  'MoveToRPY-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToRPY)))
  "Returns string type for a service object of type '<MoveToRPY>"
  "manipulator_pose_following/MoveToRPY")