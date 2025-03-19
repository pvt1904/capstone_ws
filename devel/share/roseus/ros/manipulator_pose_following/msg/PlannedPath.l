;; Auto-generated. Do not edit!


(when (boundp 'manipulator_pose_following::PlannedPath)
  (if (not (find-package "MANIPULATOR_POSE_FOLLOWING"))
    (make-package "MANIPULATOR_POSE_FOLLOWING"))
  (shadow 'PlannedPath (find-package "MANIPULATOR_POSE_FOLLOWING")))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::PLANNEDPATH")
  (make-package "MANIPULATOR_POSE_FOLLOWING::PLANNEDPATH"))

(in-package "ROS")
;;//! \htmlinclude PlannedPath.msg.html


(defclass manipulator_pose_following::PlannedPath
  :super ros::object
  :slots (_x _y _z _delta_time _calc_vel ))

(defmethod manipulator_pose_following::PlannedPath
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:delta_time __delta_time) 0.0)
    ((:calc_vel __calc_vel) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _delta_time (float __delta_time))
   (setq _calc_vel (float __calc_vel))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:delta_time
   (&optional __delta_time)
   (if __delta_time (setq _delta_time __delta_time)) _delta_time)
  (:calc_vel
   (&optional __calc_vel)
   (if __calc_vel (setq _calc_vel __calc_vel)) _calc_vel)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; float32 _delta_time
    4
    ;; float32 _calc_vel
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float32 _delta_time
       (sys::poke _delta_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _calc_vel
       (sys::poke _calc_vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float32 _delta_time
     (setq _delta_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _calc_vel
     (setq _calc_vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get manipulator_pose_following::PlannedPath :md5sum-) "80ec71fca2b6f56267998c14845654ea")
(setf (get manipulator_pose_following::PlannedPath :datatype-) "manipulator_pose_following/PlannedPath")
(setf (get manipulator_pose_following::PlannedPath :definition-)
      "float64 x
float64 y
float64 z
float32 delta_time
float32 calc_vel
")



(provide :manipulator_pose_following/PlannedPath "80ec71fca2b6f56267998c14845654ea")


