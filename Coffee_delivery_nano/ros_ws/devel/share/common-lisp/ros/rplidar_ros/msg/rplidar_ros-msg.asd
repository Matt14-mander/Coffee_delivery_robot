
(cl:in-package :asdf)

(defsystem "rplidar_ros-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Lidar_Angle" :depends-on ("_package_Lidar_Angle"))
    (:file "_package_Lidar_Angle" :depends-on ("_package"))
  ))