
(cl:in-package :asdf)

(defsystem "tarkbot_yolov5-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Image_Data" :depends-on ("_package_Image_Data"))
    (:file "_package_Image_Data" :depends-on ("_package"))
    (:file "Object" :depends-on ("_package_Object"))
    (:file "_package_Object" :depends-on ("_package"))
    (:file "ObjectArray" :depends-on ("_package_ObjectArray"))
    (:file "_package_ObjectArray" :depends-on ("_package"))
  ))