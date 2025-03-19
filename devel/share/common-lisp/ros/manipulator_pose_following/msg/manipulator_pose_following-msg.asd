
(cl:in-package :asdf)

(defsystem "manipulator_pose_following-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "DeltaPoseRPY" :depends-on ("_package_DeltaPoseRPY"))
    (:file "_package_DeltaPoseRPY" :depends-on ("_package"))
    (:file "PlannedPath" :depends-on ("_package_PlannedPath"))
    (:file "_package_PlannedPath" :depends-on ("_package"))
  ))