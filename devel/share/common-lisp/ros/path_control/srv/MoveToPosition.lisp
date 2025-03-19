; Auto-generated. Do not edit!


(cl:in-package path_control-srv)


;//! \htmlinclude MoveToPosition-request.msg.html

(cl:defclass <MoveToPosition-request> (roslisp-msg-protocol:ros-message)
  ((target_positions
    :reader target_positions
    :initarg :target_positions
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (duration
    :reader duration
    :initarg :duration
    :type cl:float
    :initform 0.0))
)

(cl:defclass MoveToPosition-request (<MoveToPosition-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToPosition-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToPosition-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_control-srv:<MoveToPosition-request> is deprecated: use path_control-srv:MoveToPosition-request instead.")))

(cl:ensure-generic-function 'target_positions-val :lambda-list '(m))
(cl:defmethod target_positions-val ((m <MoveToPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_control-srv:target_positions-val is deprecated.  Use path_control-srv:target_positions instead.")
  (target_positions m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <MoveToPosition-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_control-srv:duration-val is deprecated.  Use path_control-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToPosition-request>) ostream)
  "Serializes a message object of type '<MoveToPosition-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'target_positions))))
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
   (cl:slot-value msg 'target_positions))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToPosition-request>) istream)
  "Deserializes a message object of type '<MoveToPosition-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'target_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'target_positions)))
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'duration) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToPosition-request>)))
  "Returns string type for a service object of type '<MoveToPosition-request>"
  "path_control/MoveToPositionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToPosition-request)))
  "Returns string type for a service object of type 'MoveToPosition-request"
  "path_control/MoveToPositionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToPosition-request>)))
  "Returns md5sum for a message object of type '<MoveToPosition-request>"
  "ef814b4102028e360f0cb6df9fa221a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToPosition-request)))
  "Returns md5sum for a message object of type 'MoveToPosition-request"
  "ef814b4102028e360f0cb6df9fa221a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToPosition-request>)))
  "Returns full string definition for message of type '<MoveToPosition-request>"
  (cl:format cl:nil "float64[] target_positions  # Desired joint positions~%float64 duration            # Time to reach the target positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToPosition-request)))
  "Returns full string definition for message of type 'MoveToPosition-request"
  (cl:format cl:nil "float64[] target_positions  # Desired joint positions~%float64 duration            # Time to reach the target positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToPosition-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'target_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToPosition-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToPosition-request
    (cl:cons ':target_positions (target_positions msg))
    (cl:cons ':duration (duration msg))
))
;//! \htmlinclude MoveToPosition-response.msg.html

(cl:defclass <MoveToPosition-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MoveToPosition-response (<MoveToPosition-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveToPosition-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveToPosition-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_control-srv:<MoveToPosition-response> is deprecated: use path_control-srv:MoveToPosition-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveToPosition-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_control-srv:success-val is deprecated.  Use path_control-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveToPosition-response>) ostream)
  "Serializes a message object of type '<MoveToPosition-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveToPosition-response>) istream)
  "Deserializes a message object of type '<MoveToPosition-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveToPosition-response>)))
  "Returns string type for a service object of type '<MoveToPosition-response>"
  "path_control/MoveToPositionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToPosition-response)))
  "Returns string type for a service object of type 'MoveToPosition-response"
  "path_control/MoveToPositionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveToPosition-response>)))
  "Returns md5sum for a message object of type '<MoveToPosition-response>"
  "ef814b4102028e360f0cb6df9fa221a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveToPosition-response)))
  "Returns md5sum for a message object of type 'MoveToPosition-response"
  "ef814b4102028e360f0cb6df9fa221a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveToPosition-response>)))
  "Returns full string definition for message of type '<MoveToPosition-response>"
  (cl:format cl:nil "bool success                # Whether the operation was successful~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveToPosition-response)))
  "Returns full string definition for message of type 'MoveToPosition-response"
  (cl:format cl:nil "bool success                # Whether the operation was successful~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveToPosition-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveToPosition-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveToPosition-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveToPosition)))
  'MoveToPosition-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveToPosition)))
  'MoveToPosition-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveToPosition)))
  "Returns string type for a service object of type '<MoveToPosition>"
  "path_control/MoveToPosition")