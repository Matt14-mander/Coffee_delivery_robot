;; Auto-generated. Do not edit!


(when (boundp 'laser_warning::position)
  (if (not (find-package "LASER_WARNING"))
    (make-package "LASER_WARNING"))
  (shadow 'position (find-package "LASER_WARNING")))
(unless (find-package "LASER_WARNING::POSITION")
  (make-package "LASER_WARNING::POSITION"))

(in-package "ROS")
;;//! \htmlinclude position.msg.html


(defclass laser_warning::position
  :super ros::object
  :slots (_angleX _angleY _distance ))

(defmethod laser_warning::position
  (:init
   (&key
    ((:angleX __angleX) 0.0)
    ((:angleY __angleY) 0.0)
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _angleX (float __angleX))
   (setq _angleY (float __angleY))
   (setq _distance (float __distance))
   self)
  (:angleX
   (&optional __angleX)
   (if __angleX (setq _angleX __angleX)) _angleX)
  (:angleY
   (&optional __angleY)
   (if __angleY (setq _angleY __angleY)) _angleY)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float32 _angleX
    4
    ;; float32 _angleY
    4
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angleX
       (sys::poke _angleX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angleY
       (sys::poke _angleY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angleX
     (setq _angleX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angleY
     (setq _angleY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get laser_warning::position :md5sum-) "e4df5e09e92d9d2b4758c9aab7a9ebeb")
(setf (get laser_warning::position :datatype-) "laser_warning/position")
(setf (get laser_warning::position :definition-)
      "float32 angleX
float32 angleY
float32 distance

")



(provide :laser_warning/position "e4df5e09e92d9d2b4758c9aab7a9ebeb")


