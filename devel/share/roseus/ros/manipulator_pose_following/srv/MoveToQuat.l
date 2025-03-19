;; Auto-generated. Do not edit!


(when (boundp 'manipulator_pose_following::MoveToQuat)
  (if (not (find-package "MANIPULATOR_POSE_FOLLOWING"))
    (make-package "MANIPULATOR_POSE_FOLLOWING"))
  (shadow 'MoveToQuat (find-package "MANIPULATOR_POSE_FOLLOWING")))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVETOQUAT")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVETOQUAT"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVETOQUATREQUEST")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVETOQUATREQUEST"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::MOVETOQUATRESPONSE")
  (make-package "MANIPULATOR_POSE_FOLLOWING::MOVETOQUATRESPONSE"))

(in-package "ROS")





(defclass manipulator_pose_following::MoveToQuatRequest
  :super ros::object
  :slots (_pose_quat _max_vel_fact _max_acc_fact ))

(defmethod manipulator_pose_following::MoveToQuatRequest
  (:init
   (&key
    ((:pose_quat __pose_quat) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:max_vel_fact __max_vel_fact) 0.0)
    ((:max_acc_fact __max_acc_fact) 0.0)
    )
   (send-super :init)
   (setq _pose_quat __pose_quat)
   (setq _max_vel_fact (float __max_vel_fact))
   (setq _max_acc_fact (float __max_acc_fact))
   self)
  (:pose_quat
   (&optional __pose_quat)
   (if __pose_quat (setq _pose_quat __pose_quat)) _pose_quat)
  (:max_vel_fact
   (&optional __max_vel_fact)
   (if __max_vel_fact (setq _max_vel_fact __max_vel_fact)) _max_vel_fact)
  (:max_acc_fact
   (&optional __max_acc_fact)
   (if __max_acc_fact (setq _max_acc_fact __max_acc_fact)) _max_acc_fact)
  (:serialization-length
   ()
   (+
    ;; float32[] _pose_quat
    (* 4    (length _pose_quat)) 4
    ;; float32 _max_vel_fact
    4
    ;; float32 _max_acc_fact
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _pose_quat
     (write-long (length _pose_quat) s)
     (dotimes (i (length _pose_quat))
       (sys::poke (elt _pose_quat i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32 _max_vel_fact
       (sys::poke _max_vel_fact (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_acc_fact
       (sys::poke _max_acc_fact (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _pose_quat
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose_quat (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pose_quat i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32 _max_vel_fact
     (setq _max_vel_fact (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_acc_fact
     (setq _max_acc_fact (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass manipulator_pose_following::MoveToQuatResponse
  :super ros::object
  :slots (_reply ))

(defmethod manipulator_pose_following::MoveToQuatResponse
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

(defclass manipulator_pose_following::MoveToQuat
  :super ros::object
  :slots ())

(setf (get manipulator_pose_following::MoveToQuat :md5sum-) "4bfdf7c6ab7ed4c87dc99445fde612ed")
(setf (get manipulator_pose_following::MoveToQuat :datatype-) "manipulator_pose_following/MoveToQuat")
(setf (get manipulator_pose_following::MoveToQuat :request) manipulator_pose_following::MoveToQuatRequest)
(setf (get manipulator_pose_following::MoveToQuat :response) manipulator_pose_following::MoveToQuatResponse)

(defmethod manipulator_pose_following::MoveToQuatRequest
  (:response () (instance manipulator_pose_following::MoveToQuatResponse :init)))

(setf (get manipulator_pose_following::MoveToQuatRequest :md5sum-) "4bfdf7c6ab7ed4c87dc99445fde612ed")
(setf (get manipulator_pose_following::MoveToQuatRequest :datatype-) "manipulator_pose_following/MoveToQuatRequest")
(setf (get manipulator_pose_following::MoveToQuatRequest :definition-)
      "float32[] pose_quat
float32   max_vel_fact
float32   max_acc_fact
---
int32 reply

")

(setf (get manipulator_pose_following::MoveToQuatResponse :md5sum-) "4bfdf7c6ab7ed4c87dc99445fde612ed")
(setf (get manipulator_pose_following::MoveToQuatResponse :datatype-) "manipulator_pose_following/MoveToQuatResponse")
(setf (get manipulator_pose_following::MoveToQuatResponse :definition-)
      "float32[] pose_quat
float32   max_vel_fact
float32   max_acc_fact
---
int32 reply

")



(provide :manipulator_pose_following/MoveToQuat "4bfdf7c6ab7ed4c87dc99445fde612ed")


