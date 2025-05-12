;; Auto-generated. Do not edit!


(when (boundp 'skeleton_follow::astra_sdk_wight_hight)
  (if (not (find-package "SKELETON_FOLLOW"))
    (make-package "SKELETON_FOLLOW"))
  (shadow 'astra_sdk_wight_hight (find-package "SKELETON_FOLLOW")))
(unless (find-package "SKELETON_FOLLOW::ASTRA_SDK_WIGHT_HIGHT")
  (make-package "SKELETON_FOLLOW::ASTRA_SDK_WIGHT_HIGHT"))

(in-package "ROS")
;;//! \htmlinclude astra_sdk_wight_hight.msg.html


(defclass skeleton_follow::astra_sdk_wight_hight
  :super ros::object
  :slots (_width_l _width_r _height_t _height_b ))

(defmethod skeleton_follow::astra_sdk_wight_hight
  (:init
   (&key
    ((:width_l __width_l) 0)
    ((:width_r __width_r) 0)
    ((:height_t __height_t) 0)
    ((:height_b __height_b) 0)
    )
   (send-super :init)
   (setq _width_l (round __width_l))
   (setq _width_r (round __width_r))
   (setq _height_t (round __height_t))
   (setq _height_b (round __height_b))
   self)
  (:width_l
   (&optional __width_l)
   (if __width_l (setq _width_l __width_l)) _width_l)
  (:width_r
   (&optional __width_r)
   (if __width_r (setq _width_r __width_r)) _width_r)
  (:height_t
   (&optional __height_t)
   (if __height_t (setq _height_t __height_t)) _height_t)
  (:height_b
   (&optional __height_b)
   (if __height_b (setq _height_b __height_b)) _height_b)
  (:serialization-length
   ()
   (+
    ;; int32 _width_l
    4
    ;; int32 _width_r
    4
    ;; int32 _height_t
    4
    ;; int32 _height_b
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _width_l
       (write-long _width_l s)
     ;; int32 _width_r
       (write-long _width_r s)
     ;; int32 _height_t
       (write-long _height_t s)
     ;; int32 _height_b
       (write-long _height_b s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _width_l
     (setq _width_l (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _width_r
     (setq _width_r (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _height_t
     (setq _height_t (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _height_b
     (setq _height_b (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get skeleton_follow::astra_sdk_wight_hight :md5sum-) "4642cd8cf102c212293540c01a4443bd")
(setf (get skeleton_follow::astra_sdk_wight_hight :datatype-) "skeleton_follow/astra_sdk_wight_hight")
(setf (get skeleton_follow::astra_sdk_wight_hight :definition-)
      "int32 width_l
int32 width_r
int32 height_t
int32 height_b
")



(provide :skeleton_follow/astra_sdk_wight_hight "4642cd8cf102c212293540c01a4443bd")


