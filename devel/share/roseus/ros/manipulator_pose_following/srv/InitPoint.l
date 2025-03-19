;; Auto-generated. Do not edit!


(when (boundp 'manipulator_pose_following::InitPoint)
  (if (not (find-package "MANIPULATOR_POSE_FOLLOWING"))
    (make-package "MANIPULATOR_POSE_FOLLOWING"))
  (shadow 'InitPoint (find-package "MANIPULATOR_POSE_FOLLOWING")))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::INITPOINT")
  (make-package "MANIPULATOR_POSE_FOLLOWING::INITPOINT"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::INITPOINTREQUEST")
  (make-package "MANIPULATOR_POSE_FOLLOWING::INITPOINTREQUEST"))
(unless (find-package "MANIPULATOR_POSE_FOLLOWING::INITPOINTRESPONSE")
  (make-package "MANIPULATOR_POSE_FOLLOWING::INITPOINTRESPONSE"))

(in-package "ROS")





(defclass manipulator_pose_following::InitPointRequest
  :super ros::object
  :slots (_x _y _z _transfer_state ))

(defmethod manipulator_pose_following::InitPointRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:transfer_state __transfer_state) 0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _transfer_state (round __transfer_state))
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
  (:transfer_state
   (&optional __transfer_state)
   (if __transfer_state (setq _transfer_state __transfer_state)) _transfer_state)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; uint8 _transfer_state
    1
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
     ;; uint8 _transfer_state
       (write-byte _transfer_state s)
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
   ;; uint8 _transfer_state
     (setq _transfer_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass manipulator_pose_following::InitPointResponse
  :super ros::object
  :slots (_transfer_state ))

(defmethod manipulator_pose_following::InitPointResponse
  (:init
   (&key
    ((:transfer_state __transfer_state) 0)
    )
   (send-super :init)
   (setq _transfer_state (round __transfer_state))
   self)
  (:transfer_state
   (&optional __transfer_state)
   (if __transfer_state (setq _transfer_state __transfer_state)) _transfer_state)
  (:serialization-length
   ()
   (+
    ;; uint8 _transfer_state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _transfer_state
       (write-byte _transfer_state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _transfer_state
     (setq _transfer_state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass manipulator_pose_following::InitPoint
  :super ros::object
  :slots ())

(setf (get manipulator_pose_following::InitPoint :md5sum-) "8cbed0c946766354de767198b507d0e3")
(setf (get manipulator_pose_following::InitPoint :datatype-) "manipulator_pose_following/InitPoint")
(setf (get manipulator_pose_following::InitPoint :request) manipulator_pose_following::InitPointRequest)
(setf (get manipulator_pose_following::InitPoint :response) manipulator_pose_following::InitPointResponse)

(defmethod manipulator_pose_following::InitPointRequest
  (:response () (instance manipulator_pose_following::InitPointResponse :init)))

(setf (get manipulator_pose_following::InitPointRequest :md5sum-) "8cbed0c946766354de767198b507d0e3")
(setf (get manipulator_pose_following::InitPointRequest :datatype-) "manipulator_pose_following/InitPointRequest")
(setf (get manipulator_pose_following::InitPointRequest :definition-)
      "#request fields
float64 x
float64 y
float64 z
uint8 transfer_state
---
uint8 transfer_state
")

(setf (get manipulator_pose_following::InitPointResponse :md5sum-) "8cbed0c946766354de767198b507d0e3")
(setf (get manipulator_pose_following::InitPointResponse :datatype-) "manipulator_pose_following/InitPointResponse")
(setf (get manipulator_pose_following::InitPointResponse :definition-)
      "#request fields
float64 x
float64 y
float64 z
uint8 transfer_state
---
uint8 transfer_state
")



(provide :manipulator_pose_following/InitPoint "8cbed0c946766354de767198b507d0e3")


