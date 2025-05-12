
(cl:in-package :asdf)

(defsystem "light_service-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Light_Set" :depends-on ("_package_Light_Set"))
    (:file "_package_Light_Set" :depends-on ("_package"))
  ))