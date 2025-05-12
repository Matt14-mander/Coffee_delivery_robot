;; Auto-generated. Do not edit!


(when (boundp 'skeleton_follow::astra_sdk_maskdata)
  (if (not (find-package "SKELETON_FOLLOW"))
    (make-package "SKELETON_FOLLOW"))
  (shadow 'astra_sdk_maskdata (find-package "SKELETON_FOLLOW")))
(unless (find-package "SKELETON_FOLLOW::ASTRA_SDK_MASKDATA")
  (make-package "SKELETON_FOLLOW::ASTRA_SDK_MASKDATA"))

(in-package "ROS")
;;//! \htmlinclude astra_sdk_maskdata.msg.html


(defclass skeleton_follow::astra_sdk_maskdata
  :super ros::object
  :slots (_data ))

(defmethod skeleton_follow::astra_sdk_maskdata
  (:init
   (&key
    ((:data __data) (make-array 76800 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32[76800] _data
    (* 4    76800)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[76800] _data
     (dotimes (i 76800)
       (write-long (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[76800] _data
   (dotimes (i (length _data))
     (setf (elt _data i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get skeleton_follow::astra_sdk_maskdata :md5sum-) "83e374be3f0eff604357f0d088c7c236")
(setf (get skeleton_follow::astra_sdk_maskdata :datatype-) "skeleton_follow/astra_sdk_maskdata")
(setf (get skeleton_follow::astra_sdk_maskdata :definition-)
      "int32[76800] data
")



(provide :skeleton_follow/astra_sdk_maskdata "83e374be3f0eff604357f0d088c7c236")


