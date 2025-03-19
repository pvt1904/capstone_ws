;; Auto-generated. Do not edit!


(when (boundp 'path_control::ControllMsg)
  (if (not (find-package "PATH_CONTROL"))
    (make-package "PATH_CONTROL"))
  (shadow 'ControllMsg (find-package "PATH_CONTROL")))
(unless (find-package "PATH_CONTROL::CONTROLLMSG")
  (make-package "PATH_CONTROL::CONTROLLMSG"))

(in-package "ROS")
;;//! \htmlinclude ControllMsg.msg.html


(defclass path_control::ControllMsg
  :super ros::object
  :slots (_positions _velocities _dt _is_trusted_msg ))

(defmethod path_control::ControllMsg
  (:init
   (&key
    ((:positions __positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:velocities __velocities) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:dt __dt) 0.0)
    ((:is_trusted_msg __is_trusted_msg) nil)
    )
   (send-super :init)
   (setq _positions __positions)
   (setq _velocities __velocities)
   (setq _dt (float __dt))
   (setq _is_trusted_msg __is_trusted_msg)
   self)
  (:positions
   (&optional __positions)
   (if __positions (setq _positions __positions)) _positions)
  (:velocities
   (&optional __velocities)
   (if __velocities (setq _velocities __velocities)) _velocities)
  (:dt
   (&optional __dt)
   (if __dt (setq _dt __dt)) _dt)
  (:is_trusted_msg
   (&optional (__is_trusted_msg :null))
   (if (not (eq __is_trusted_msg :null)) (setq _is_trusted_msg __is_trusted_msg)) _is_trusted_msg)
  (:serialization-length
   ()
   (+
    ;; float64[] _positions
    (* 8    (length _positions)) 4
    ;; float64[] _velocities
    (* 8    (length _velocities)) 4
    ;; float64 _dt
    8
    ;; bool _is_trusted_msg
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _positions
     (write-long (length _positions) s)
     (dotimes (i (length _positions))
       (sys::poke (elt _positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _velocities
     (write-long (length _velocities) s)
     (dotimes (i (length _velocities))
       (sys::poke (elt _velocities i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _dt
       (sys::poke _dt (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _is_trusted_msg
       (if _is_trusted_msg (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _velocities
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _velocities (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _velocities i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _dt
     (setq _dt (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _is_trusted_msg
     (setq _is_trusted_msg (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get path_control::ControllMsg :md5sum-) "98ada26a4817920a2d40c6220f1d0fd9")
(setf (get path_control::ControllMsg :datatype-) "path_control/ControllMsg")
(setf (get path_control::ControllMsg :definition-)
      "float64[] positions
float64[] velocities
float64 dt
bool is_trusted_msg
")



(provide :path_control/ControllMsg "98ada26a4817920a2d40c6220f1d0fd9")


