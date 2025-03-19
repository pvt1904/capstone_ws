;; Auto-generated. Do not edit!


(when (boundp 'path_control::MoveToPosition)
  (if (not (find-package "PATH_CONTROL"))
    (make-package "PATH_CONTROL"))
  (shadow 'MoveToPosition (find-package "PATH_CONTROL")))
(unless (find-package "PATH_CONTROL::MOVETOPOSITION")
  (make-package "PATH_CONTROL::MOVETOPOSITION"))
(unless (find-package "PATH_CONTROL::MOVETOPOSITIONREQUEST")
  (make-package "PATH_CONTROL::MOVETOPOSITIONREQUEST"))
(unless (find-package "PATH_CONTROL::MOVETOPOSITIONRESPONSE")
  (make-package "PATH_CONTROL::MOVETOPOSITIONRESPONSE"))

(in-package "ROS")





(defclass path_control::MoveToPositionRequest
  :super ros::object
  :slots (_target_positions _duration ))

(defmethod path_control::MoveToPositionRequest
  (:init
   (&key
    ((:target_positions __target_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:duration __duration) 0.0)
    )
   (send-super :init)
   (setq _target_positions __target_positions)
   (setq _duration (float __duration))
   self)
  (:target_positions
   (&optional __target_positions)
   (if __target_positions (setq _target_positions __target_positions)) _target_positions)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:serialization-length
   ()
   (+
    ;; float64[] _target_positions
    (* 8    (length _target_positions)) 4
    ;; float64 _duration
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _target_positions
     (write-long (length _target_positions) s)
     (dotimes (i (length _target_positions))
       (sys::poke (elt _target_positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _duration
       (sys::poke _duration (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _target_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _target_positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _target_positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _duration
     (setq _duration (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass path_control::MoveToPositionResponse
  :super ros::object
  :slots (_success ))

(defmethod path_control::MoveToPositionResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass path_control::MoveToPosition
  :super ros::object
  :slots ())

(setf (get path_control::MoveToPosition :md5sum-) "ef814b4102028e360f0cb6df9fa221a9")
(setf (get path_control::MoveToPosition :datatype-) "path_control/MoveToPosition")
(setf (get path_control::MoveToPosition :request) path_control::MoveToPositionRequest)
(setf (get path_control::MoveToPosition :response) path_control::MoveToPositionResponse)

(defmethod path_control::MoveToPositionRequest
  (:response () (instance path_control::MoveToPositionResponse :init)))

(setf (get path_control::MoveToPositionRequest :md5sum-) "ef814b4102028e360f0cb6df9fa221a9")
(setf (get path_control::MoveToPositionRequest :datatype-) "path_control/MoveToPositionRequest")
(setf (get path_control::MoveToPositionRequest :definition-)
      "float64[] target_positions  # Desired joint positions
float64 duration            # Time to reach the target positions
---
bool success                # Whether the operation was successful

")

(setf (get path_control::MoveToPositionResponse :md5sum-) "ef814b4102028e360f0cb6df9fa221a9")
(setf (get path_control::MoveToPositionResponse :datatype-) "path_control/MoveToPositionResponse")
(setf (get path_control::MoveToPositionResponse :definition-)
      "float64[] target_positions  # Desired joint positions
float64 duration            # Time to reach the target positions
---
bool success                # Whether the operation was successful

")



(provide :path_control/MoveToPosition "ef814b4102028e360f0cb6df9fa221a9")


