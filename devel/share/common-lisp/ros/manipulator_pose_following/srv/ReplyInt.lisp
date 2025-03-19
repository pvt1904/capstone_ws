; Auto-generated. Do not edit!


(cl:in-package manipulator_pose_following-srv)


;//! \htmlinclude ReplyInt-request.msg.html

(cl:defclass <ReplyInt-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ReplyInt-request (<ReplyInt-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReplyInt-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReplyInt-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<ReplyInt-request> is deprecated: use manipulator_pose_following-srv:ReplyInt-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReplyInt-request>) ostream)
  "Serializes a message object of type '<ReplyInt-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReplyInt-request>) istream)
  "Deserializes a message object of type '<ReplyInt-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReplyInt-request>)))
  "Returns string type for a service object of type '<ReplyInt-request>"
  "manipulator_pose_following/ReplyIntRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReplyInt-request)))
  "Returns string type for a service object of type 'ReplyInt-request"
  "manipulator_pose_following/ReplyIntRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReplyInt-request>)))
  "Returns md5sum for a message object of type '<ReplyInt-request>"
  "a3d102284a2e84efb923807f61669857")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReplyInt-request)))
  "Returns md5sum for a message object of type 'ReplyInt-request"
  "a3d102284a2e84efb923807f61669857")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReplyInt-request>)))
  "Returns full string definition for message of type '<ReplyInt-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReplyInt-request)))
  "Returns full string definition for message of type 'ReplyInt-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReplyInt-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReplyInt-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ReplyInt-request
))
;//! \htmlinclude ReplyInt-response.msg.html

(cl:defclass <ReplyInt-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:integer
    :initform 0))
)

(cl:defclass ReplyInt-response (<ReplyInt-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReplyInt-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReplyInt-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<ReplyInt-response> is deprecated: use manipulator_pose_following-srv:ReplyInt-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <ReplyInt-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:reply-val is deprecated.  Use manipulator_pose_following-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReplyInt-response>) ostream)
  "Serializes a message object of type '<ReplyInt-response>"
  (cl:let* ((signed (cl:slot-value msg 'reply)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReplyInt-response>) istream)
  "Deserializes a message object of type '<ReplyInt-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reply) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReplyInt-response>)))
  "Returns string type for a service object of type '<ReplyInt-response>"
  "manipulator_pose_following/ReplyIntResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReplyInt-response)))
  "Returns string type for a service object of type 'ReplyInt-response"
  "manipulator_pose_following/ReplyIntResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReplyInt-response>)))
  "Returns md5sum for a message object of type '<ReplyInt-response>"
  "a3d102284a2e84efb923807f61669857")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReplyInt-response)))
  "Returns md5sum for a message object of type 'ReplyInt-response"
  "a3d102284a2e84efb923807f61669857")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReplyInt-response>)))
  "Returns full string definition for message of type '<ReplyInt-response>"
  (cl:format cl:nil "int32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReplyInt-response)))
  "Returns full string definition for message of type 'ReplyInt-response"
  (cl:format cl:nil "int32 reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReplyInt-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReplyInt-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ReplyInt-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ReplyInt)))
  'ReplyInt-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ReplyInt)))
  'ReplyInt-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReplyInt)))
  "Returns string type for a service object of type '<ReplyInt>"
  "manipulator_pose_following/ReplyInt")