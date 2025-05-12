;; Auto-generated. Do not edit!


(when (boundp 'tarkbot_driver_yolo::ControlWay)
  (if (not (find-package "TARKBOT_DRIVER_YOLO"))
    (make-package "TARKBOT_DRIVER_YOLO"))
  (shadow 'ControlWay (find-package "TARKBOT_DRIVER_YOLO")))
(unless (find-package "TARKBOT_DRIVER_YOLO::CONTROLWAY")
  (make-package "TARKBOT_DRIVER_YOLO::CONTROLWAY"))

(in-package "ROS")
;;//! \htmlinclude ControlWay.msg.html


(defclass tarkbot_driver_yolo::ControlWay
  :super ros::object
  :slots (_mask_x_left _mask_x_right _mask_y_top _mask_y_bot _center_target _vel_x _vel_y_P _vel_y_D _vel_z_P _vel_z_D _en ))

(defmethod tarkbot_driver_yolo::ControlWay
  (:init
   (&key
    ((:mask_x_left __mask_x_left) 0.0)
    ((:mask_x_right __mask_x_right) 0.0)
    ((:mask_y_top __mask_y_top) 0.0)
    ((:mask_y_bot __mask_y_bot) 0.0)
    ((:center_target __center_target) 0.0)
    ((:vel_x __vel_x) 0.0)
    ((:vel_y_P __vel_y_P) 0.0)
    ((:vel_y_D __vel_y_D) 0.0)
    ((:vel_z_P __vel_z_P) 0.0)
    ((:vel_z_D __vel_z_D) 0.0)
    ((:en __en) 0)
    )
   (send-super :init)
   (setq _mask_x_left (float __mask_x_left))
   (setq _mask_x_right (float __mask_x_right))
   (setq _mask_y_top (float __mask_y_top))
   (setq _mask_y_bot (float __mask_y_bot))
   (setq _center_target (float __center_target))
   (setq _vel_x (float __vel_x))
   (setq _vel_y_P (float __vel_y_P))
   (setq _vel_y_D (float __vel_y_D))
   (setq _vel_z_P (float __vel_z_P))
   (setq _vel_z_D (float __vel_z_D))
   (setq _en (round __en))
   self)
  (:mask_x_left
   (&optional __mask_x_left)
   (if __mask_x_left (setq _mask_x_left __mask_x_left)) _mask_x_left)
  (:mask_x_right
   (&optional __mask_x_right)
   (if __mask_x_right (setq _mask_x_right __mask_x_right)) _mask_x_right)
  (:mask_y_top
   (&optional __mask_y_top)
   (if __mask_y_top (setq _mask_y_top __mask_y_top)) _mask_y_top)
  (:mask_y_bot
   (&optional __mask_y_bot)
   (if __mask_y_bot (setq _mask_y_bot __mask_y_bot)) _mask_y_bot)
  (:center_target
   (&optional __center_target)
   (if __center_target (setq _center_target __center_target)) _center_target)
  (:vel_x
   (&optional __vel_x)
   (if __vel_x (setq _vel_x __vel_x)) _vel_x)
  (:vel_y_P
   (&optional __vel_y_P)
   (if __vel_y_P (setq _vel_y_P __vel_y_P)) _vel_y_P)
  (:vel_y_D
   (&optional __vel_y_D)
   (if __vel_y_D (setq _vel_y_D __vel_y_D)) _vel_y_D)
  (:vel_z_P
   (&optional __vel_z_P)
   (if __vel_z_P (setq _vel_z_P __vel_z_P)) _vel_z_P)
  (:vel_z_D
   (&optional __vel_z_D)
   (if __vel_z_D (setq _vel_z_D __vel_z_D)) _vel_z_D)
  (:en
   (&optional __en)
   (if __en (setq _en __en)) _en)
  (:serialization-length
   ()
   (+
    ;; float32 _mask_x_left
    4
    ;; float32 _mask_x_right
    4
    ;; float32 _mask_y_top
    4
    ;; float32 _mask_y_bot
    4
    ;; float32 _center_target
    4
    ;; float32 _vel_x
    4
    ;; float32 _vel_y_P
    4
    ;; float32 _vel_y_D
    4
    ;; float32 _vel_z_P
    4
    ;; float32 _vel_z_D
    4
    ;; int8 _en
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _mask_x_left
       (sys::poke _mask_x_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mask_x_right
       (sys::poke _mask_x_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mask_y_top
       (sys::poke _mask_y_top (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _mask_y_bot
       (sys::poke _mask_y_bot (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _center_target
       (sys::poke _center_target (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_x
       (sys::poke _vel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_y_P
       (sys::poke _vel_y_P (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_y_D
       (sys::poke _vel_y_D (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_z_P
       (sys::poke _vel_z_P (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_z_D
       (sys::poke _vel_z_D (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int8 _en
       (write-byte _en s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _mask_x_left
     (setq _mask_x_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mask_x_right
     (setq _mask_x_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mask_y_top
     (setq _mask_y_top (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _mask_y_bot
     (setq _mask_y_bot (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _center_target
     (setq _center_target (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_x
     (setq _vel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_y_P
     (setq _vel_y_P (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_y_D
     (setq _vel_y_D (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_z_P
     (setq _vel_z_P (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_z_D
     (setq _vel_z_D (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int8 _en
     (setq _en (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _en 127) (setq _en (- _en 256)))
   ;;
   self)
  )

(setf (get tarkbot_driver_yolo::ControlWay :md5sum-) "8c848fda070f270966c6dcd98dd08d58")
(setf (get tarkbot_driver_yolo::ControlWay :datatype-) "tarkbot_driver_yolo/ControlWay")
(setf (get tarkbot_driver_yolo::ControlWay :definition-)
      "float32 mask_x_left

float32 mask_x_right

float32 mask_y_top

float32 mask_y_bot

float32 center_target

float32 vel_x

float32 vel_y_P

float32 vel_y_D

float32 vel_z_P

float32 vel_z_D

int8 en

")



(provide :tarkbot_driver_yolo/ControlWay "8c848fda070f270966c6dcd98dd08d58")


