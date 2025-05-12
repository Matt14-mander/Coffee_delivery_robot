;; Auto-generated. Do not edit!


(when (boundp 'skeleton_follow::astra_sdk_body)
  (if (not (find-package "SKELETON_FOLLOW"))
    (make-package "SKELETON_FOLLOW"))
  (shadow 'astra_sdk_body (find-package "SKELETON_FOLLOW")))
(unless (find-package "SKELETON_FOLLOW::ASTRA_SDK_BODY")
  (make-package "SKELETON_FOLLOW::ASTRA_SDK_BODY"))

(in-package "ROS")
;;//! \htmlinclude astra_sdk_body.msg.html


(defclass skeleton_follow::astra_sdk_body
  :super ros::object
  :slots (_bodyid _centerOfMass _joints ))

(defmethod skeleton_follow::astra_sdk_body
  (:init
   (&key
    ((:bodyid __bodyid) 0)
    ((:centerOfMass __centerOfMass) (instance skeleton_follow::astra_sdk_vector3f :init))
    ((:joints __joints) (let (r) (dotimes (i 19) (push (instance skeleton_follow::astra_sdk_joint :init) r)) r))
    )
   (send-super :init)
   (setq _bodyid (round __bodyid))
   (setq _centerOfMass __centerOfMass)
   (setq _joints __joints)
   self)
  (:bodyid
   (&optional __bodyid)
   (if __bodyid (setq _bodyid __bodyid)) _bodyid)
  (:centerOfMass
   (&rest __centerOfMass)
   (if (keywordp (car __centerOfMass))
       (send* _centerOfMass __centerOfMass)
     (progn
       (if __centerOfMass (setq _centerOfMass (car __centerOfMass)))
       _centerOfMass)))
  (:joints
   (&rest __joints)
   (if (keywordp (car __joints))
       (send* _joints __joints)
     (progn
       (if __joints (setq _joints (car __joints)))
       _joints)))
  (:serialization-length
   ()
   (+
    ;; int16 _bodyid
    2
    ;; skeleton_follow/astra_sdk_vector3f _centerOfMass
    (send _centerOfMass :serialization-length)
    ;; skeleton_follow/astra_sdk_joint[19] _joints
    (apply #'+ (send-all _joints :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _bodyid
       (write-word _bodyid s)
     ;; skeleton_follow/astra_sdk_vector3f _centerOfMass
       (send _centerOfMass :serialize s)
     ;; skeleton_follow/astra_sdk_joint[19] _joints
     (dolist (elem _joints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _bodyid
     (setq _bodyid (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; skeleton_follow/astra_sdk_vector3f _centerOfMass
     (send _centerOfMass :deserialize buf ptr-) (incf ptr- (send _centerOfMass :serialization-length))
   ;; skeleton_follow/astra_sdk_joint[19] _joints
   (dotimes (i 19)
     (send (elt _joints i) :deserialize buf ptr-) (incf ptr- (send (elt _joints i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get skeleton_follow::astra_sdk_body :md5sum-) "57f2da357721aaca7548e8de3d97f76a")
(setf (get skeleton_follow::astra_sdk_body :datatype-) "skeleton_follow/astra_sdk_body")
(setf (get skeleton_follow::astra_sdk_body :definition-)
      "int16 bodyid
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



(provide :skeleton_follow/astra_sdk_body "57f2da357721aaca7548e8de3d97f76a")


