;; Auto-generated. Do not edit!


(when (boundp 'manipulator_pose_following::ReplyInt)
  (if (not (find-package "MANIPULATOR_POSE_FOLLOWING"))
    (make-package "MANIPULATOR_POSE_FOLLOWING"))
  (shadow 'ReplyInt (find-package "MANIPULATOR_POSE_FOLLOWING")))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::REPLYINT")
  (make-package "MANIPULATOR_POSE_FOLLOWING::REPLYINT"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::REPLYINTREQUEST")
  (make-package "MANIPULATOR_POSE_FOLLOWING::REPLYINTREQUEST"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::REPLYINTRESPONSE")
  (make-package "MANIPULATOR_POSE_FOLLOWING::REPLYINTRESPONSE"))

(in-package "ROS")





(defclass manipulator_pose_following::ReplyIntRequest
  :super ros::object
  :slots ())

(defmethod manipulator_pose_following::ReplyIntRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass manipulator_pose_following::ReplyIntResponse
  :super ros::object
  :slots (_reply ))

(defmethod manipulator_pose_following::ReplyIntResponse
  (:init
   (&key
    ((:reply __reply) 0)
    )
   (send-super :init)
   (setq _reply (round __reply))
   self)
  (:reply
   (&optional __reply)
   (if __reply (setq _reply __reply)) _reply)
  (:serialization-length
   ()
   (+
    ;; int32 _reply
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _reply
       (write-long _reply s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _reply
     (setq _reply (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass manipulator_pose_following::ReplyInt
  :super ros::object
  :slots ())

(setf (get manipulator_pose_following::ReplyInt :md5sum-) "a3d102284a2e84efb923807f61669857")
(setf (get manipulator_pose_following::ReplyInt :datatype-) "manipulator_pose_following/ReplyInt")
(setf (get manipulator_pose_following::ReplyInt :request) manipulator_pose_following::ReplyIntRequest)
(setf (get manipulator_pose_following::ReplyInt :response) manipulator_pose_following::ReplyIntResponse)

(defmethod manipulator_pose_following::ReplyIntRequest
  (:response () (instance manipulator_pose_following::ReplyIntResponse :init)))

(setf (get manipulator_pose_following::ReplyIntRequest :md5sum-) "a3d102284a2e84efb923807f61669857")
(setf (get manipulator_pose_following::ReplyIntRequest :datatype-) "manipulator_pose_following/ReplyIntRequest")
(setf (get manipulator_pose_following::ReplyIntRequest :definition-)
      "---
int32 reply

")

(setf (get manipulator_pose_following::ReplyIntResponse :md5sum-) "a3d102284a2e84efb923807f61669857")
(setf (get manipulator_pose_following::ReplyIntResponse :datatype-) "manipulator_pose_following/ReplyIntResponse")
(setf (get manipulator_pose_following::ReplyIntResponse :definition-)
      "---
int32 reply

")



(provide :manipulator_pose_following/ReplyInt "a3d102284a2e84efb923807f61669857")


