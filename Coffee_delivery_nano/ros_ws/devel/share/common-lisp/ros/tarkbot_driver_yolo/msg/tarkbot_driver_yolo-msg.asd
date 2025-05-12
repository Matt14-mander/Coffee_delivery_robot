
(cl:in-package :asdf)

(defsystem "tarkbot_driver_yolo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ControlWay" :depends-on ("_package_ControlWay"))
    (:file "_package_ControlWay" :depends-on ("_package"))
  ))