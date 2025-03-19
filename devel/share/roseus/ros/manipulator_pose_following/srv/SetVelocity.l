;; Auto-generated. Do not edit!


(when (boundp 'manipulator_pose_following::SetVelocity)
  (if (not (find-package "MANIPULATOR_POSE_FOLLOWING"))
    (make-package "MANIPULATOR_POSE_FOLLOWING"))
  (shadow 'SetVelocity (find-package "MANIPULATOR_POSE_FOLLOWING")))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::SETVELOCITY")
  (make-package "MANIPULATOR_POSE_FOLLOWING::SETVELOCITY"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::SETVELOCITYREQUEST")
  (make-package "MANIPULATOR_POSE_FOLLOWING::SETVELOCITYREQUEST"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::SETVELOCITYRESPONSE")
  (make-package "MANIPULATOR_POSE_FOLLOWING::SETVELOCITYRESPONSE"))

(in-package "ROS")





(defclass manipulator_pose_following::SetVelocityRequest
  :super ros::object
  :slots (_velocity ))

(defmethod manipulator_pose_following::SetVelocityRequest
  (:init
   (&key
    ((:velocity __velocity) 0.0)
    )
   (send-super :init)
   (setq _velocity (float __velocity))
   self)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; float32 _velocity
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _velocity
     (setq _velocity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass manipulator_pose_following::SetVelocityResponse
  :super ros::object
  :slots (_result ))

(defmethod manipulator_pose_following::SetVelocityResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass manipulator_pose_following::SetVelocity
  :super ros::object
  :slots ())

(setf (get manipulator_pose_following::SetVelocity :md5sum-) "db9dc0428873a36d1bd052ccc7f0c504")
(setf (get manipulator_pose_following::SetVelocity :datatype-) "manipulator_pose_following/SetVelocity")
(setf (get manipulator_pose_following::SetVelocity :request) manipulator_pose_following::SetVelocityRequest)
(setf (get manipulator_pose_following::SetVelocity :response) manipulator_pose_following::SetVelocityResponse)

(defmethod manipulator_pose_following::SetVelocityRequest
  (:response () (instance manipulator_pose_following::SetVelocityResponse :init)))

(setf (get manipulator_pose_following::SetVelocityRequest :md5sum-) "db9dc0428873a36d1bd052ccc7f0c504")
(setf (get manipulator_pose_following::SetVelocityRequest :datatype-) "manipulator_pose_following/SetVelocityRequest")
(setf (get manipulator_pose_following::SetVelocityRequest :definition-)
      "float32 velocity
---
bool result

")

(setf (get manipulator_pose_following::SetVelocityResponse :md5sum-) "db9dc0428873a36d1bd052ccc7f0c504")
(setf (get manipulator_pose_following::SetVelocityResponse :datatype-) "manipulator_pose_following/SetVelocityResponse")
(setf (get manipulator_pose_following::SetVelocityResponse :definition-)
      "float32 velocity
---
bool result

")



(provide :manipulator_pose_following/SetVelocity "db9dc0428873a36d1bd052ccc7f0c504")


