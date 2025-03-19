; Auto-generated. Do not edit!


(cl:in-package manipulator_pose_following-srv)


;//! \htmlinclude InitPoint-request.msg.html

(cl:defclass <InitPoint-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (transfer_state
    :reader transfer_state
    :initarg :transfer_state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass InitPoint-request (<InitPoint-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InitPoint-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InitPoint-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<InitPoint-request> is deprecated: use manipulator_pose_following-srv:InitPoint-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <InitPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:x-val is deprecated.  Use manipulator_pose_following-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <InitPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:y-val is deprecated.  Use manipulator_pose_following-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <InitPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:z-val is deprecated.  Use manipulator_pose_following-srv:z instead.")
  (z m))

(cl:ensure-generic-function 'transfer_state-val :lambda-list '(m))
(cl:defmethod transfer_state-val ((m <InitPoint-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:transfer_state-val is deprecated.  Use manipulator_pose_following-srv:transfer_state instead.")
  (transfer_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InitPoint-request>) ostream)
  "Serializes a message object of type '<InitPoint-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'transfer_state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InitPoint-request>) istream)
  "Deserializes a message object of type '<InitPoint-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'transfer_state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InitPoint-request>)))
  "Returns string type for a service object of type '<InitPoint-request>"
  "manipulator_pose_following/InitPointRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitPoint-request)))
  "Returns string type for a service object of type 'InitPoint-request"
  "manipulator_pose_following/InitPointRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InitPoint-request>)))
  "Returns md5sum for a message object of type '<InitPoint-request>"
  "8cbed0c946766354de767198b507d0e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InitPoint-request)))
  "Returns md5sum for a message object of type 'InitPoint-request"
  "8cbed0c946766354de767198b507d0e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InitPoint-request>)))
  "Returns full string definition for message of type '<InitPoint-request>"
  (cl:format cl:nil "#request fields~%float64 x~%float64 y~%float64 z~%uint8 transfer_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InitPoint-request)))
  "Returns full string definition for message of type 'InitPoint-request"
  (cl:format cl:nil "#request fields~%float64 x~%float64 y~%float64 z~%uint8 transfer_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InitPoint-request>))
  (cl:+ 0
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InitPoint-request>))
  "Converts a ROS message object to a list"
  (cl:list 'InitPoint-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':transfer_state (transfer_state msg))
))
;//! \htmlinclude InitPoint-response.msg.html

(cl:defclass <InitPoint-response> (roslisp-msg-protocol:ros-message)
  ((transfer_state
    :reader transfer_state
    :initarg :transfer_state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass InitPoint-response (<InitPoint-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InitPoint-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InitPoint-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-srv:<InitPoint-response> is deprecated: use manipulator_pose_following-srv:InitPoint-response instead.")))

(cl:ensure-generic-function 'transfer_state-val :lambda-list '(m))
(cl:defmethod transfer_state-val ((m <InitPoint-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-srv:transfer_state-val is deprecated.  Use manipulator_pose_following-srv:transfer_state instead.")
  (transfer_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InitPoint-response>) ostream)
  "Serializes a message object of type '<InitPoint-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'transfer_state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InitPoint-response>) istream)
  "Deserializes a message object of type '<InitPoint-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'transfer_state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InitPoint-response>)))
  "Returns string type for a service object of type '<InitPoint-response>"
  "manipulator_pose_following/InitPointResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitPoint-response)))
  "Returns string type for a service object of type 'InitPoint-response"
  "manipulator_pose_following/InitPointResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InitPoint-response>)))
  "Returns md5sum for a message object of type '<InitPoint-response>"
  "8cbed0c946766354de767198b507d0e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InitPoint-response)))
  "Returns md5sum for a message object of type 'InitPoint-response"
  "8cbed0c946766354de767198b507d0e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InitPoint-response>)))
  "Returns full string definition for message of type '<InitPoint-response>"
  (cl:format cl:nil "uint8 transfer_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InitPoint-response)))
  "Returns full string definition for message of type 'InitPoint-response"
  (cl:format cl:nil "uint8 transfer_state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InitPoint-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InitPoint-response>))
  "Converts a ROS message object to a list"
  (cl:list 'InitPoint-response
    (cl:cons ':transfer_state (transfer_state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'InitPoint)))
  'InitPoint-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'InitPoint)))
  'InitPoint-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitPoint)))
  "Returns string type for a service object of type '<InitPoint>"
  "manipulator_pose_following/InitPoint")