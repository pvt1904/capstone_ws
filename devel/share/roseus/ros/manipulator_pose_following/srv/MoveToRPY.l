;; Auto-generated. Do not edit!


(when (boundp 'manipulator_pose_following::MoveToRPY)
  (if (not (find-package "MANIPULATOR_POSE_FOLLOWING"))
    (make-package "MANIPULATOR_POSE_FOLLOWING"))
  (shadow 'MoveToRPY (find-package "MANIPULATOR_POSE_FOLLOWING")))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVETORPY")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVETORPY"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVETORPYREQUEST")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVETORPYREQUEST"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVETORPYRESPONSE")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVETORPYRESPONSE"))

(in-package "ROS")





(defclass manipulator_pose_following::MoveToRPYRequest
  :super ros::object
  :slots (_pose_rpy _max_vel_fact _max_acc_fact ))

(defmethod manipulator_pose_following::MoveToRPYRequest
  (:init
   (&key
    ((:pose_rpy __pose_rpy) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:max_vel_fact __max_vel_fact) 0.0)
    ((:max_acc_fact __max_acc_fact) 0.0)
    )
   (send-super :init)
   (setq _pose_rpy __pose_rpy)
   (setq _max_vel_fact (float __max_vel_fact))
   (setq _max_acc_fact (float __max_acc_fact))
   self)
  (:pose_rpy
   (&optional __pose_rpy)
   (if __pose_rpy (setq _pose_rpy __pose_rpy)) _pose_rpy)
  (:max_vel_fact
   (&optional __max_vel_fact)
   (if __max_vel_fact (setq _max_vel_fact __max_vel_fact)) _max_vel_fact)
  (:max_acc_fact
   (&optional __max_acc_fact)
   (if __max_acc_fact (setq _max_acc_fact __max_acc_fact)) _max_acc_fact)
  (:serialization-length
   ()
   (+
    ;; float32[] _pose_rpy
    (* 4    (length _pose_rpy)) 4
    ;; float32 _max_vel_fact
    4
    ;; float32 _max_acc_fact
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _pose_rpy
     (write-long (length _pose_rpy) s)
     (dotimes (i (length _pose_rpy))
       (sys::poke (elt _pose_rpy i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _max_vel_fact
       (sys::poke _max_vel_fact (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_acc_fact
       (sys::poke _max_acc_fact (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _pose_rpy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose_rpy (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pose_rpy i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _max_vel_fact
     (setq _max_vel_fact (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_acc_fact
     (setq _max_acc_fact (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass manipulator_pose_following::MoveToRPYResponse
  :super ros::object
  :slots (_reply ))

(defmethod manipulator_pose_following::MoveToRPYResponse
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

(defclass manipulator_pose_following::MoveToRPY
  :super ros::object
  :slots ())

(setf (get manipulator_pose_following::MoveToRPY :md5sum-) "a228832e898673e8095d7a0ddc0283a1")
(setf (get manipulator_pose_following::MoveToRPY :datatype-) "manipulator_pose_following/MoveToRPY")
(setf (get manipulator_pose_following::MoveToRPY :request) manipulator_pose_following::MoveToRPYRequest)
(setf (get manipulator_pose_following::MoveToRPY :response) manipulator_pose_following::MoveToRPYResponse)

(defmethod manipulator_pose_following::MoveToRPYRequest
  (:response () (instance manipulator_pose_following::MoveToRPYResponse :init)))

(setf (get manipulator_pose_following::MoveToRPYRequest :md5sum-) "a228832e898673e8095d7a0ddc0283a1")
(setf (get manipulator_pose_following::MoveToRPYRequest :datatype-) "manipulator_pose_following/MoveToRPYRequest")
(setf (get manipulator_pose_following::MoveToRPYRequest :definition-)
      "float32[] pose_rpy
float32   max_vel_fact
float32   max_acc_fact
---
int32 reply

")

(setf (get manipulator_pose_following::MoveToRPYResponse :md5sum-) "a228832e898673e8095d7a0ddc0283a1")
(setf (get manipulator_pose_following::MoveToRPYResponse :datatype-) "manipulator_pose_following/MoveToRPYResponse")
(setf (get manipulator_pose_following::MoveToRPYResponse :definition-)
      "float32[] pose_rpy
float32   max_vel_fact
float32   max_acc_fact
---
int32 reply

")



(provide :manipulator_pose_following/MoveToRPY "a228832e898673e8095d7a0ddc0283a1")


