;; Auto-generated. Do not edit!


(when (boundp 'skeleton_follow::astra_sdk_joint)
  (if (not (find-package "SKELETON_FOLLOW"))
    (make-package "SKELETON_FOLLOW"))
  (shadow 'astra_sdk_joint (find-package "SKELETON_FOLLOW")))
(unless (find-package "SKELETON_FOLLOW::ASTRA_SDK_JOINT")
  (make-package "SKELETON_FOLLOW::ASTRA_SDK_JOINT"))

(in-package "ROS")
;;//! \htmlinclude astra_sdk_joint.msg.html


(defclass skeleton_follow::astra_sdk_joint
  :super ros::object
  :slots (_type _depthPosition _worldPosition ))

(defmethod skeleton_follow::astra_sdk_joint
  (:init
   (&key
    ((:type __type) 0)
    ((:depthPosition __depthPosition) (instance skeleton_follow::astra_sdk_vector2f :init))
    ((:worldPosition __worldPosition) (instance skeleton_follow::astra_sdk_vector3f :init))
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _depthPosition __depthPosition)
   (setq _worldPosition __worldPosition)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:depthPosition
   (&rest __depthPosition)
   (if (keywordp (car __depthPosition))
       (send* _depthPosition __depthPosition)
     (progn
       (if __depthPosition (setq _depthPosition (car __depthPosition)))
       _depthPosition)))
  (:worldPosition
   (&rest __worldPosition)
   (if (keywordp (car __worldPosition))
       (send* _worldPosition __worldPosition)
     (progn
       (if __worldPosition (setq _worldPosition (car __worldPosition)))
       _worldPosition)))
  (:serialization-length
   ()
   (+
    ;; int8 _type
    1
    ;; skeleton_follow/astra_sdk_vector2f _depthPosition
    (send _depthPosition :serialization-length)
    ;; skeleton_follow/astra_sdk_vector3f _worldPosition
    (send _worldPosition :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _type
       (write-byte _type s)
     ;; skeleton_follow/astra_sdk_vector2f _depthPosition
       (send _depthPosition :serialize s)
     ;; skeleton_follow/astra_sdk_vector3f _worldPosition
       (send _worldPosition :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _type 127) (setq _type (- _type 256)))
   ;; skeleton_follow/astra_sdk_vector2f _depthPosition
     (send _depthPosition :deserialize buf ptr-) (incf ptr- (send _depthPosition :serialization-length))
   ;; skeleton_follow/astra_sdk_vector3f _worldPosition
     (send _worldPosition :deserialize buf ptr-) (incf ptr- (send _worldPosition :serialization-length))
   ;;
   self)
  )

(setf (get skeleton_follow::astra_sdk_joint :md5sum-) "e4de40bc4d9da2df315d3755d4261051")
(setf (get skeleton_follow::astra_sdk_joint :datatype-) "skeleton_follow/astra_sdk_joint")
(setf (get skeleton_follow::astra_sdk_joint :definition-)
      "int8 type
astra_sdk_vector2f depthPosition
astra_sdk_vector3f worldPosition
================================================================================
MSG: skeleton_follow/astra_sdk_vector2f
float32 x
float32 y
================================================================================
MSG: skeleton_follow/astra_sdk_vector3f
float32 x
float32 y
float32 z
")



(provide :skeleton_follow/astra_sdk_joint "e4de40bc4d9da2df315d3755d4261051")


