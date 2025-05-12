;; Auto-generated. Do not edit!


(when (boundp 'xtlidar_ros::Control)
  (if (not (find-package "XTLIDAR_ROS"))
    (make-package "XTLIDAR_ROS"))
  (shadow 'Control (find-package "XTLIDAR_ROS")))
(unless (find-package "XTLIDAR_ROS::CONTROL")
  (make-package "XTLIDAR_ROS::CONTROL"))
(unless (find-package "XTLIDAR_ROS::CONTROLREQUEST")
  (make-package "XTLIDAR_ROS::CONTROLREQUEST"))
(unless (find-package "XTLIDAR_ROS::CONTROLRESPONSE")
  (make-package "XTLIDAR_ROS::CONTROLRESPONSE"))

(in-package "ROS")





(defclass xtlidar_ros::ControlRequest
  :super ros::object
  :slots (_index ))

(defmethod xtlidar_ros::ControlRequest
  (:init
   (&key
    ((:index __index) 0)
    )
   (send-super :init)
   (setq _index (round __index))
   self)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:serialization-length
   ()
   (+
    ;; int64 _index
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _index
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _index (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _index) (= (length (_index . bv)) 2)) ;; bignum
              (write-long (ash (elt (_index . bv) 0) 0) s)
              (write-long (ash (elt (_index . bv) 1) -1) s))
             ((and (class _index) (= (length (_index . bv)) 1)) ;; big1
              (write-long (elt (_index . bv) 0) s)
              (write-long (if (>= _index 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _index s)(write-long (if (>= _index 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _index
#+(or :alpha :irix6 :x86_64)
      (setf _index (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _index (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass xtlidar_ros::ControlResponse
  :super ros::object
  :slots ())

(defmethod xtlidar_ros::ControlResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass xtlidar_ros::Control
  :super ros::object
  :slots ())

(setf (get xtlidar_ros::Control :md5sum-) "6a92c772b35d41f76733d8eb9779b0e1")
(setf (get xtlidar_ros::Control :datatype-) "xtlidar_ros/Control")
(setf (get xtlidar_ros::Control :request) xtlidar_ros::ControlRequest)
(setf (get xtlidar_ros::Control :response) xtlidar_ros::ControlResponse)

(defmethod xtlidar_ros::ControlRequest
  (:response () (instance xtlidar_ros::ControlResponse :init)))

(setf (get xtlidar_ros::ControlRequest :md5sum-) "6a92c772b35d41f76733d8eb9779b0e1")
(setf (get xtlidar_ros::ControlRequest :datatype-) "xtlidar_ros/ControlRequest")
(setf (get xtlidar_ros::ControlRequest :definition-)
      "int64 index
---
")

(setf (get xtlidar_ros::ControlResponse :md5sum-) "6a92c772b35d41f76733d8eb9779b0e1")
(setf (get xtlidar_ros::ControlResponse :datatype-) "xtlidar_ros/ControlResponse")
(setf (get xtlidar_ros::ControlResponse :definition-)
      "int64 index
---
")



(provide :xtlidar_ros/Control "6a92c772b35d41f76733d8eb9779b0e1")


