; Auto-generated. Do not edit!


(cl:in-package manipulator_pose_following-msg)


;//! \htmlinclude DeltaPoseRPY.msg.html

(cl:defclass <DeltaPoseRPY> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass DeltaPoseRPY (<DeltaPoseRPY>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DeltaPoseRPY>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DeltaPoseRPY)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-msg:<DeltaPoseRPY> is deprecated: use manipulator_pose_following-msg:DeltaPoseRPY instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <DeltaPoseRPY>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-msg:data-val is deprecated.  Use manipulator_pose_following-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DeltaPoseRPY>) ostream)
  "Serializes a message object of type '<DeltaPoseRPY>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DeltaPoseRPY>) istream)
  "Deserializes a message object of type '<DeltaPoseRPY>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DeltaPoseRPY>)))
  "Returns string type for a message object of type '<DeltaPoseRPY>"
  "manipulator_pose_following/DeltaPoseRPY")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DeltaPoseRPY)))
  "Returns string type for a message object of type 'DeltaPoseRPY"
  "manipulator_pose_following/DeltaPoseRPY")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DeltaPoseRPY>)))
  "Returns md5sum for a message object of type '<DeltaPoseRPY>"
  "788898178a3da2c3718461eecda8f714")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DeltaPoseRPY)))
  "Returns md5sum for a message object of type 'DeltaPoseRPY"
  "788898178a3da2c3718461eecda8f714")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DeltaPoseRPY>)))
  "Returns full string definition for message of type '<DeltaPoseRPY>"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DeltaPoseRPY)))
  "Returns full string definition for message of type 'DeltaPoseRPY"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DeltaPoseRPY>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DeltaPoseRPY>))
  "Converts a ROS message object to a list"
  (cl:list 'DeltaPoseRPY
    (cl:cons ':data (data msg))
))
