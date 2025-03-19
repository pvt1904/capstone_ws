
(cl:in-package :asdf)

(defsystem "manipulator_pose_following-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "InitPoint" :depends-on ("_package_InitPoint"))
    (:file "_package_InitPoint" :depends-on ("_package"))
    (:file "MoveHome" :depends-on ("_package_MoveHome"))
    (:file "_package_MoveHome" :depends-on ("_package"))
    (:file "MoveToQuat" :depends-on ("_package_MoveToQuat"))
    (:file "_package_MoveToQuat" :depends-on ("_package"))
    (:file "MoveToRPY" :depends-on ("_package_MoveToRPY"))
    (:file "_package_MoveToRPY" :depends-on ("_package"))
    (:file "ReplyInt" :depends-on ("_package_ReplyInt"))
    (:file "_package_ReplyInt" :depends-on ("_package"))
    (:file "SetVelocity" :depends-on ("_package_SetVelocity"))
    (:file "_package_SetVelocity" :depends-on ("_package"))
  ))