;; Auto-generated. Do not edit!


(when (boundp 'rplidar_ros::Lidar_Angle)
  (if (not (find-package "RPLIDAR_ROS"))
    (make-package "RPLIDAR_ROS"))
  (shadow 'Lidar_Angle (find-package "RPLIDAR_ROS")))
(unless (find-package "RPLIDAR_ROS::LIDAR_ANGLE")
  (make-package "RPLIDAR_ROS::LIDAR_ANGLE"))

(in-package "ROS")
;;//! \htmlinclude Lidar_Angle.msg.html


(defclass rplidar_ros::Lidar_Angle
  :super ros::object
  :slots (_start_angle _end_angle ))

(defmethod rplidar_ros::Lidar_Angle
  (:init
   (&key
    ((:start_angle __start_angle) 0)
    ((:end_angle __end_angle) 0)
    )
   (send-super :init)
   (setq _start_angle (round __start_angle))
   (setq _end_angle (round __end_angle))
   self)
  (:start_angle
   (&optional __start_angle)
   (if __start_angle (setq _start_angle __start_angle)) _start_angle)
  (:end_angle
   (&optional __end_angle)
   (if __end_angle (setq _end_angle __end_angle)) _end_angle)
  (:serialization-length
   ()
   (+
    ;; int16 _start_angle
    2
    ;; int16 _end_angle
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _start_angle
       (write-word _start_angle s)
     ;; int16 _end_angle
       (write-word _end_angle s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _start_angle
     (setq _start_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int16 _end_angle
     (setq _end_angle (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get rplidar_ros::Lidar_Angle :md5sum-) "2684a80dd6dd0c664a3b5f39f5f7cc9e")
(setf (get rplidar_ros::Lidar_Angle :datatype-) "rplidar_ros/Lidar_Angle")
(setf (get rplidar_ros::Lidar_Angle :definition-)
      "int16 start_angle
int16 end_angle

")



(provide :rplidar_ros/Lidar_Angle "2684a80dd6dd0c664a3b5f39f5f7cc9e")


