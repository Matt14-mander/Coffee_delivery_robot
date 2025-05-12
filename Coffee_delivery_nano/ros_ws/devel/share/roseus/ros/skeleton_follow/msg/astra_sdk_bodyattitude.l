;; Auto-generated. Do not edit!


(when (boundp 'skeleton_follow::astra_sdk_bodyattitude)
  (if (not (find-package "SKELETON_FOLLOW"))
    (make-package "SKELETON_FOLLOW"))
  (shadow 'astra_sdk_bodyattitude (find-package "SKELETON_FOLLOW")))
(unless (find-package "SKELETON_FOLLOW::ASTRA_SDK_BODYATTITUDE")
  (make-package "SKELETON_FOLLOW::ASTRA_SDK_BODYATTITUDE"))

(in-package "ROS")
;;//! \htmlinclude astra_sdk_bodyattitude.msg.html


(defclass skeleton_follow::astra_sdk_bodyattitude
  :super ros::object
  :slots (_bodyid _CenterOfMass_X _CenterOfMass_Y _CenterOfMass_Z _left_arm_out _right_arm_out _left_hand_raised _right_hand_raised _akimibo _left_foot_up _right_foot_up _fall _tips _lock_status ))

(defmethod skeleton_follow::astra_sdk_bodyattitude
  (:init
   (&key
    ((:bodyid __bodyid) 0)
    ((:CenterOfMass_X __CenterOfMass_X) 0.0)
    ((:CenterOfMass_Y __CenterOfMass_Y) 0.0)
    ((:CenterOfMass_Z __CenterOfMass_Z) 0.0)
    ((:left_arm_out __left_arm_out) 0)
    ((:right_arm_out __right_arm_out) 0)
    ((:left_hand_raised __left_hand_raised) 0)
    ((:right_hand_raised __right_hand_raised) 0)
    ((:akimibo __akimibo) 0)
    ((:left_foot_up __left_foot_up) 0)
    ((:right_foot_up __right_foot_up) 0)
    ((:fall __fall) 0)
    ((:tips __tips) 0)
    ((:lock_status __lock_status) 0)
    )
   (send-super :init)
   (setq _bodyid (round __bodyid))
   (setq _CenterOfMass_X (float __CenterOfMass_X))
   (setq _CenterOfMass_Y (float __CenterOfMass_Y))
   (setq _CenterOfMass_Z (float __CenterOfMass_Z))
   (setq _left_arm_out (round __left_arm_out))
   (setq _right_arm_out (round __right_arm_out))
   (setq _left_hand_raised (round __left_hand_raised))
   (setq _right_hand_raised (round __right_hand_raised))
   (setq _akimibo (round __akimibo))
   (setq _left_foot_up (round __left_foot_up))
   (setq _right_foot_up (round __right_foot_up))
   (setq _fall (round __fall))
   (setq _tips (round __tips))
   (setq _lock_status (round __lock_status))
   self)
  (:bodyid
   (&optional __bodyid)
   (if __bodyid (setq _bodyid __bodyid)) _bodyid)
  (:CenterOfMass_X
   (&optional __CenterOfMass_X)
   (if __CenterOfMass_X (setq _CenterOfMass_X __CenterOfMass_X)) _CenterOfMass_X)
  (:CenterOfMass_Y
   (&optional __CenterOfMass_Y)
   (if __CenterOfMass_Y (setq _CenterOfMass_Y __CenterOfMass_Y)) _CenterOfMass_Y)
  (:CenterOfMass_Z
   (&optional __CenterOfMass_Z)
   (if __CenterOfMass_Z (setq _CenterOfMass_Z __CenterOfMass_Z)) _CenterOfMass_Z)
  (:left_arm_out
   (&optional __left_arm_out)
   (if __left_arm_out (setq _left_arm_out __left_arm_out)) _left_arm_out)
  (:right_arm_out
   (&optional __right_arm_out)
   (if __right_arm_out (setq _right_arm_out __right_arm_out)) _right_arm_out)
  (:left_hand_raised
   (&optional __left_hand_raised)
   (if __left_hand_raised (setq _left_hand_raised __left_hand_raised)) _left_hand_raised)
  (:right_hand_raised
   (&optional __right_hand_raised)
   (if __right_hand_raised (setq _right_hand_raised __right_hand_raised)) _right_hand_raised)
  (:akimibo
   (&optional __akimibo)
   (if __akimibo (setq _akimibo __akimibo)) _akimibo)
  (:left_foot_up
   (&optional __left_foot_up)
   (if __left_foot_up (setq _left_foot_up __left_foot_up)) _left_foot_up)
  (:right_foot_up
   (&optional __right_foot_up)
   (if __right_foot_up (setq _right_foot_up __right_foot_up)) _right_foot_up)
  (:fall
   (&optional __fall)
   (if __fall (setq _fall __fall)) _fall)
  (:tips
   (&optional __tips)
   (if __tips (setq _tips __tips)) _tips)
  (:lock_status
   (&optional __lock_status)
   (if __lock_status (setq _lock_status __lock_status)) _lock_status)
  (:serialization-length
   ()
   (+
    ;; int16 _bodyid
    2
    ;; float32 _CenterOfMass_X
    4
    ;; float32 _CenterOfMass_Y
    4
    ;; float32 _CenterOfMass_Z
    4
    ;; int8 _left_arm_out
    1
    ;; int8 _right_arm_out
    1
    ;; int8 _left_hand_raised
    1
    ;; int8 _right_hand_raised
    1
    ;; int8 _akimibo
    1
    ;; int8 _left_foot_up
    1
    ;; int8 _right_foot_up
    1
    ;; int8 _fall
    1
    ;; int8 _tips
    1
    ;; int8 _lock_status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _bodyid
       (write-word _bodyid s)
     ;; float32 _CenterOfMass_X
       (sys::poke _CenterOfMass_X (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _CenterOfMass_Y
       (sys::poke _CenterOfMass_Y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _CenterOfMass_Z
       (sys::poke _CenterOfMass_Z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _left_arm_out
       (write-byte _left_arm_out s)
     ;; int8 _right_arm_out
       (write-byte _right_arm_out s)
     ;; int8 _left_hand_raised
       (write-byte _left_hand_raised s)
     ;; int8 _right_hand_raised
       (write-byte _right_hand_raised s)
     ;; int8 _akimibo
       (write-byte _akimibo s)
     ;; int8 _left_foot_up
       (write-byte _left_foot_up s)
     ;; int8 _right_foot_up
       (write-byte _right_foot_up s)
     ;; int8 _fall
       (write-byte _fall s)
     ;; int8 _tips
       (write-byte _tips s)
     ;; int8 _lock_status
       (write-byte _lock_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _bodyid
     (setq _bodyid (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float32 _CenterOfMass_X
     (setq _CenterOfMass_X (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _CenterOfMass_Y
     (setq _CenterOfMass_Y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _CenterOfMass_Z
     (setq _CenterOfMass_Z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _left_arm_out
     (setq _left_arm_out (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _left_arm_out 127) (setq _left_arm_out (- _left_arm_out 256)))
   ;; int8 _right_arm_out
     (setq _right_arm_out (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _right_arm_out 127) (setq _right_arm_out (- _right_arm_out 256)))
   ;; int8 _left_hand_raised
     (setq _left_hand_raised (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _left_hand_raised 127) (setq _left_hand_raised (- _left_hand_raised 256)))
   ;; int8 _right_hand_raised
     (setq _right_hand_raised (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _right_hand_raised 127) (setq _right_hand_raised (- _right_hand_raised 256)))
   ;; int8 _akimibo
     (setq _akimibo (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _akimibo 127) (setq _akimibo (- _akimibo 256)))
   ;; int8 _left_foot_up
     (setq _left_foot_up (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _left_foot_up 127) (setq _left_foot_up (- _left_foot_up 256)))
   ;; int8 _right_foot_up
     (setq _right_foot_up (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _right_foot_up 127) (setq _right_foot_up (- _right_foot_up 256)))
   ;; int8 _fall
     (setq _fall (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _fall 127) (setq _fall (- _fall 256)))
   ;; int8 _tips
     (setq _tips (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _tips 127) (setq _tips (- _tips 256)))
   ;; int8 _lock_status
     (setq _lock_status (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _lock_status 127) (setq _lock_status (- _lock_status 256)))
   ;;
   self)
  )

(setf (get skeleton_follow::astra_sdk_bodyattitude :md5sum-) "cb21bd82e96aab6d386d23fcd631b859")
(setf (get skeleton_follow::astra_sdk_bodyattitude :datatype-) "skeleton_follow/astra_sdk_bodyattitude")
(setf (get skeleton_follow::astra_sdk_bodyattitude :definition-)
      "int16 bodyid
float32 CenterOfMass_X
float32 CenterOfMass_Y
float32 CenterOfMass_Z
int8 left_arm_out
int8 right_arm_out
int8 left_hand_raised
int8 right_hand_raised
int8 akimibo
int8 left_foot_up
int8 right_foot_up
int8 fall
int8 tips
int8 lock_status

")



(provide :skeleton_follow/astra_sdk_bodyattitude "cb21bd82e96aab6d386d23fcd631b859")


