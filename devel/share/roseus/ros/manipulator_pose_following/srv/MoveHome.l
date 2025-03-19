;; Auto-generated. Do not edit!


(when (boundp 'manipulator_pose_following::MoveHome)
  (if (not (find-package "MANIPULATOR_POSE_FOLLOWING"))
    (make-package "MANIPULATOR_POSE_FOLLOWING"))
  (shadow 'MoveHome (find-package "MANIPULATOR_POSE_FOLLOWING")))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVEHOME")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVEHOME"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVEHOMEREQUEST")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVEHOMEREQUEST"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVEHOMERESPONSE")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVEHOMERESPONSE"))

(in-package "ROS")





(defclass manipulator_pose_following::MoveHomeRequest
  :super ros::object
  :slots (_max_vel_fact _max_acc_fact ))

(defmethod manipulator_pose_following::MoveHomeRequest
  (:init
   (&key
    ((:max_vel_fact __max_vel_fact) 0.0)
    ((:max_acc_fact __max_acc_fact) 0.0)
    )
   (send-super :init)
   (setq _max_vel_fact (float __max_vel_fact))
   (setq _max_acc_fact (float __max_acc_fact))
   self)
  (:max_vel_fact
   (&optional __max_vel_fact)
   (if __max_vel_fact (setq _max_vel_fact __max_vel_fact)) _max_vel_fact)
  (:max_acc_fact
   (&optional __max_acc_fact)
   (if __max_acc_fact (setq _max_acc_fact __max_acc_fact)) _max_acc_fact)
  (:serialization-length
   ()
   (+
    ;; float32 _max_vel_fact
    4
    ;; float32 _max_acc_fact
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _max_vel_fact
       (sys::poke _max_vel_fact (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_acc_fact
       (sys::poke _max_acc_fact (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _max_vel_fact
     (setq _max_vel_fact (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_acc_fact
     (setq _max_acc_fact (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass manipulator_pose_following::MoveHomeResponse
  :super ros::object
  :slots (_reply ))

(defmethod manipulator_pose_following::MoveHomeResponse
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

(defclass manipulator_pose_following::MoveHome
  :super ros::object
  :slots ())

(setf (get manipulator_pose_following::MoveHome :md5sum-) "2b1a8682c27b5174f22f80c985fc7be9")
(setf (get manipulator_pose_following::MoveHome :datatype-) "manipulator_pose_following/MoveHome")
(setf (get manipulator_pose_following::MoveHome :request) manipulator_pose_following::MoveHomeRequest)
(setf (get manipulator_pose_following::MoveHome :response) manipulator_pose_following::MoveHomeResponse)

(defmethod manipulator_pose_following::MoveHomeRequest
  (:response () (instance manipulator_pose_following::MoveHomeResponse :init)))

(setf (get manipulator_pose_following::MoveHomeRequest :md5sum-) "2b1a8682c27b5174f22f80c985fc7be9")
(setf (get manipulator_pose_following::MoveHomeRequest :datatype-) "manipulator_pose_following/MoveHomeRequest")
(setf (get manipulator_pose_following::MoveHomeRequest :definition-)
      "float32 max_vel_fact
float32 max_acc_fact
---
int32 reply

")

(setf (get manipulator_pose_following::MoveHomeResponse :md5sum-) "2b1a8682c27b5174f22f80c985fc7be9")
(setf (get manipulator_pose_following::MoveHomeResponse :datatype-) "manipulator_pose_following/MoveHomeResponse")
(setf (get manipulator_pose_following::MoveHomeResponse :definition-)
      "float32 max_vel_fact
float32 max_acc_fact
---
int32 reply

")



(provide :manipulator_pose_following/MoveHome "2b1a8682c27b5174f22f80c985fc7be9")


