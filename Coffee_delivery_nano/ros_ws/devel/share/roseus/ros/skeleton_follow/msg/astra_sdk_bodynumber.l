;; Auto-generated. Do not edit!


(when (boundp 'skeleton_follow::astra_sdk_bodynumber)
  (if (not (find-package "SKELETON_FOLLOW"))
    (make-package "SKELETON_FOLLOW"))
  (shadow 'astra_sdk_bodynumber (find-package "SKELETON_FOLLOW")))
(unless (find-package "SKELETON_FOLLOW::ASTRA_SDK_BODYNUMBER")
  (make-package "SKELETON_FOLLOW::ASTRA_SDK_BODYNUMBER"))

(in-package "ROS")
;;//! \htmlinclude astra_sdk_bodynumber.msg.html


(defclass skeleton_follow::astra_sdk_bodynumber
  :super ros::object
  :slots (_count _bodies ))

(defmethod skeleton_follow::astra_sdk_bodynumber
  (:init
   (&key
    ((:count __count) 0)
    ((:bodies __bodies) (let (r) (dotimes (i 6) (push (instance skeleton_follow::astra_sdk_body :init) r)) r))
    )
   (send-super :init)
   (setq _count (round __count))
   (setq _bodies __bodies)
   self)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:bodies
   (&rest __bodies)
   (if (keywordp (car __bodies))
       (send* _bodies __bodies)
     (progn
       (if __bodies (setq _bodies (car __bodies)))
       _bodies)))
  (:serialization-length
   ()
   (+
    ;; int8 _count
    1
    ;; skeleton_follow/astra_sdk_body[6] _bodies
    (apply #'+ (send-all _bodies :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _count
       (write-byte _count s)
     ;; skeleton_follow/astra_sdk_body[6] _bodies
     (dolist (elem _bodies)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _count
     (setq _count (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _count 127) (setq _count (- _count 256)))
   ;; skeleton_follow/astra_sdk_body[6] _bodies
   (dotimes (i 6)
     (send (elt _bodies i) :deserialize buf ptr-) (incf ptr- (send (elt _bodies i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get skeleton_follow::astra_sdk_bodynumber :md5sum-) "a1b1dea345dbea1f84926cdcaf9c5b80")
(setf (get skeleton_follow::astra_sdk_bodynumber :datatype-) "skeleton_follow/astra_sdk_bodynumber")
(setf (get skeleton_follow::astra_sdk_bodynumber :definition-)
      "int8 count
astra_sdk_body[6] bodies
================================================================================
MSG: skeleton_follow/astra_sdk_body
int16 bodyid
astra_sdk_vector3f centerOfMass
astra_sdk_joint[19] joints
================================================================================
MSG: skeleton_follow/astra_sdk_vector3f
float32 x
float32 y
float32 z
================================================================================
MSG: skeleton_follow/astra_sdk_joint
int8 type
astra_sdk_vector2f depthPosition
astra_sdk_vector3f worldPosition
================================================================================
MSG: skeleton_follow/astra_sdk_vector2f
float32 x
float32 y
")



(provide :skeleton_follow/astra_sdk_bodynumber "a1b1dea345dbea1f84926cdcaf9c5b80")


