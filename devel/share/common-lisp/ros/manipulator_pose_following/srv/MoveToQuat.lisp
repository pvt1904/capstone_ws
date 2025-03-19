; Auto-generated. Do not edit!


(cl:in-package manipulator_pose_following-srv)


;//! \htmlinclude MoveToQuat-request.msg.html

(cl:defclass <MoveToQuat-request> (roslisp-msg-protocol:ros-message)
  ((pose_quat
    :reader pose_quat
    :initarg :pose_quat
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

(cl:defclass MoveToQuat-request (<MoveToQuat-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToQuat-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToQuat-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<MoveToQuat-request> is deprecated: use manipulator_pose_following-srv:MoveToQuat-request instead.")))

(cl:ensure-generic-function 'pose_quat-val :lambda-list '(m))
(cl:defmethod pose_quat-val ((m <MoveToQuat-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:pose_quat-val is deprecated.  Use manipulator_pose_following-srv:pose_quat instead.")
  (pose_quat m))

(cl:ensure-generic-function 'max_vel_fact-val :lambda-list '(m))
(cl:defmethod max_vel_fact-val ((m <MoveToQuat-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:max_vel_fact-val is deprecated.  Use manipulator_pose_following-srv:max_vel_fact instead.")
  (max_vel_fact m))

(cl:ensure-generic-function 'max_acc_fact-val :lambda-list '(m))
(cl:defmethod max_acc_fact-val ((m <MoveToQuat-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:max_acc_fact-val is deprecated.  Use manipulator_pose_following-srv:max_acc_fact instead.")
  (max_acc_fact m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToQuat-request>) ostream)
  "Serializes a message object of type '<MoveToQuat-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose_quat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'pose_quat))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToQuat-request>) istream)
  "Deserializes a message object of type '<MoveToQuat-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose_quat) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose_quat)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToQuat-request>)))
  "Returns string type for a service object of type '<MoveToQuat-request>"
  "manipulator_pose_following/MoveToQuatRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToQuat-request)))
  "Returns string type for a service object of type 'MoveToQuat-request"
  "manipulator_pose_following/MoveToQuatRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToQuat-request>)))
  "Returns md5sum for a message object of type '<MoveToQuat-request>"
  "4bfdf7c6ab7ed4c87dc99445fde612ed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToQuat-request)))
  "Returns md5sum for a message object of type 'MoveToQuat-request"
  "4bfdf7c6ab7ed4c87dc99445fde612ed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToQuat-request>)))
  "Returns full string definition for message of type '<MoveToQuat-request>"
  (cl:format cl:nil "float32[] pose_quat~%float32   max_vel_fact~%float32   max_acc_fact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToQuat-request)))
  "Returns full string definition for message of type 'MoveToQuat-request"
  (cl:format cl:nil "float32[] pose_quat~%float32   max_vel_fact~%float32   max_acc_fact~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToQuat-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose_quat) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToQuat-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToQuat-request
    (cl:cons ':pose_quat (pose_quat msg))
    (cl:cons ':max_vel_fact (max_vel_fact msg))
    (cl:cons ':max_acc_fact (max_acc_fact msg))
))
;//! \htmlinclude MoveToQuat-response.msg.html

(cl:defclass <MoveToQuat-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveToQuat-response (<MoveToQuat-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToQuat-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToQuat-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<MoveToQuat-response> is deprecated: use manipulator_pose_following-srv:MoveToQuat-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <MoveToQuat-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:reply-val is deprecated.  Use manipulator_pose_following-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToQuat-response>) ostream)
  "Serializes a message object of type '<MoveToQuat-response>"
  (cl:let* ((signed (cl:slot-value msg 'reply)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToQuat-response>) istream)
  "Deserializes a message object of type '<MoveToQuat-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reply) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToQuat-response>)))
  "Returns string type for a service object of type '<MoveToQuat-response>"
  "manipulator_pose_following/MoveToQuatResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToQuat-response)))
  "Returns string type for a service object of type 'MoveToQuat-response"
  "manipulator_pose_following/MoveToQuatResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToQuat-response>)))
  "Returns md5sum for a message object of type '<MoveToQuat-response>"
  "4bfdf7c6ab7ed4c87dc99445fde612ed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToQuat-response)))
  "Returns md5sum for a message object of type 'MoveToQuat-response"
  "4bfdf7c6ab7ed4c87dc99445fde612ed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToQuat-response>)))
  "Returns full string definition for message of type '<MoveToQuat-response>"
  (cl:format cl:nil "int32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToQuat-response)))
  "Returns full string definition for message of type 'MoveToQuat-response"
  (cl:format cl:nil "int32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToQuat-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToQuat-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToQuat-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveToQuat)))
  'MoveToQuat-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveToQuat)))
  'MoveToQuat-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToQuat)))
  "Returns string type for a service object of type '<MoveToQuat>"
  "manipulator_pose_following/MoveToQuat")