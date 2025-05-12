;; Auto-generated. Do not edit!


(when (boundp 'tarkbot_yolov5::ObjectArray)
  (if (not (find-package "TARKBOT_YOLOV5"))
    (make-package "TARKBOT_YOLOV5"))
  (shadow 'ObjectArray (find-package "TARKBOT_YOLOV5")))
(unless (find-package "TARKBOT_YOLOV5::OBJECTARRAY")
  (make-package "TARKBOT_YOLOV5::OBJECTARRAY"))

(in-package "ROS")
;;//! \htmlinclude ObjectArray.msg.html


(defclass tarkbot_yolov5::ObjectArray
  :super ros::object
  :slots (_data ))

(defmethod tarkbot_yolov5::ObjectArray
  (:init
   (&key
    ((:data __data) (let (r) (dotimes (i 0) (push (instance tarkbot_yolov5::Object :init) r)) r))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; tarkbot_yolov5/Object[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; tarkbot_yolov5/Object[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; tarkbot_yolov5/Object[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance tarkbot_yolov5::Object :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get tarkbot_yolov5::ObjectArray :md5sum-) "5c74c52b301e4b25679f3941c4f6f23f")
(setf (get tarkbot_yolov5::ObjectArray :datatype-) "tarkbot_yolov5/ObjectArray")
(setf (get tarkbot_yolov5::ObjectArray :definition-)
      "tarkbot_yolov5/Object[] data

================================================================================
MSG: tarkbot_yolov5/Object
string frame_id
time stamp
float32 scores
float32 ptx
float32 pty
float32 distw
float32 disth
float32 centerx
float32 centery

")



(provide :tarkbot_yolov5/ObjectArray "5c74c52b301e4b25679f3941c4f6f23f")


