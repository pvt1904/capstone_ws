; Auto-generated. Do not edit!


(cl:in-package manipulator_pose_following-msg)


;//! \htmlinclude PlannedPath.msg.html

(cl:defclass <PlannedPath> (roslisp-msg-protocol:ros-message)
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
   (delta_time
    :reader delta_time
    :initarg :delta_time
    :type cl:float
    :initform 0.0)
   (calc_vel
    :reader calc_vel
    :initarg :calc_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass PlannedPath (<PlannedPath>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PlannedPath>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PlannedPath)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name manipulator_pose_following-msg:<PlannedPath> is deprecated: use manipulator_pose_following-msg:PlannedPath instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <PlannedPath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-msg:x-val is deprecated.  Use manipulator_pose_following-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <PlannedPath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-msg:y-val is deprecated.  Use manipulator_pose_following-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <PlannedPath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-msg:z-val is deprecated.  Use manipulator_pose_following-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'delta_time-val :lambda-list '(m))
(cl:defmethod delta_time-val ((m <PlannedPath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-msg:delta_time-val is deprecated.  Use manipulator_pose_following-msg:delta_time instead.")
  (delta_time m))

(cl:ensure-generic-function 'calc_vel-val :lambda-list '(m))
(cl:defmethod calc_vel-val ((m <PlannedPath>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader manipulator_pose_following-msg:calc_vel-val is deprecated.  Use manipulator_pose_following-msg:calc_vel instead.")
  (calc_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PlannedPath>) ostream)
  "Serializes a message object of type '<PlannedPath>"
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
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'delta_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'calc_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PlannedPath>) istream)
  "Deserializes a message object of type '<PlannedPath>"
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
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'delta_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'calc_vel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PlannedPath>)))
  "Returns string type for a message object of type '<PlannedPath>"
  "manipulator_pose_following/PlannedPath")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PlannedPath)))
  "Returns string type for a message object of type 'PlannedPath"
  "manipulator_pose_following/PlannedPath")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PlannedPath>)))
  "Returns md5sum for a message object of type '<PlannedPath>"
  "80ec71fca2b6f56267998c14845654ea")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PlannedPath)))
  "Returns md5sum for a message object of type 'PlannedPath"
  "80ec71fca2b6f56267998c14845654ea")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PlannedPath>)))
  "Returns full string definition for message of type '<PlannedPath>"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%float32 delta_time~%float32 calc_vel~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PlannedPath)))
  "Returns full string definition for message of type 'PlannedPath"
  (cl:format cl:nil "float64 x~%float64 y~%float64 z~%float32 delta_time~%float32 calc_vel~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PlannedPath>))
  (cl:+ 0
     8
     8
     8
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PlannedPath>))
  "Converts a ROS message object to a list"
  (cl:list 'PlannedPath
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':delta_time (delta_time msg))
    (cl:cons ':calc_vel (calc_vel msg))
))
