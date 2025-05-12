;; Auto-generated. Do not edit!


(when (boundp 'light_service::Light_Set)
  (if (not (find-package "LIGHT_SERVICE"))
    (make-package "LIGHT_SERVICE"))
  (shadow 'Light_Set (find-package "LIGHT_SERVICE")))
(unless (find-package "LIGHT_SERVICE::LIGHT_SET")
  (make-package "LIGHT_SERVICE::LIGHT_SET"))
(unless (find-package "LIGHT_SERVICE::LIGHT_SETREQUEST")
  (make-package "LIGHT_SERVICE::LIGHT_SETREQUEST"))
(unless (find-package "LIGHT_SERVICE::LIGHT_SETRESPONSE")
  (make-package "LIGHT_SERVICE::LIGHT_SETRESPONSE"))

(in-package "ROS")





(defclass light_service::Light_SetRequest
  :super ros::object
  :slots (_RGB_M_ _RGB_S_ _RGB_T_ _RGB_R_ _RGB_G_ _RGB_B_ ))

(defmethod light_service::Light_SetRequest
  (:init
   (&key
    ((:RGB_M_ __RGB_M_) 0)
    ((:RGB_S_ __RGB_S_) 0)
    ((:RGB_T_ __RGB_T_) 0)
    ((:RGB_R_ __RGB_R_) 0)
    ((:RGB_G_ __RGB_G_) 0)
    ((:RGB_B_ __RGB_B_) 0)
    )
   (send-super :init)
   (setq _RGB_M_ (round __RGB_M_))
   (setq _RGB_S_ (round __RGB_S_))
   (setq _RGB_T_ (round __RGB_T_))
   (setq _RGB_R_ (round __RGB_R_))
   (setq _RGB_G_ (round __RGB_G_))
   (setq _RGB_B_ (round __RGB_B_))
   self)
  (:RGB_M_
   (&optional __RGB_M_)
   (if __RGB_M_ (setq _RGB_M_ __RGB_M_)) _RGB_M_)
  (:RGB_S_
   (&optional __RGB_S_)
   (if __RGB_S_ (setq _RGB_S_ __RGB_S_)) _RGB_S_)
  (:RGB_T_
   (&optional __RGB_T_)
   (if __RGB_T_ (setq _RGB_T_ __RGB_T_)) _RGB_T_)
  (:RGB_R_
   (&optional __RGB_R_)
   (if __RGB_R_ (setq _RGB_R_ __RGB_R_)) _RGB_R_)
  (:RGB_G_
   (&optional __RGB_G_)
   (if __RGB_G_ (setq _RGB_G_ __RGB_G_)) _RGB_G_)
  (:RGB_B_
   (&optional __RGB_B_)
   (if __RGB_B_ (setq _RGB_B_ __RGB_B_)) _RGB_B_)
  (:serialization-length
   ()
   (+
    ;; int8 _RGB_M_
    1
    ;; int8 _RGB_S_
    1
    ;; uint8 _RGB_T_
    1
    ;; uint8 _RGB_R_
    1
    ;; uint8 _RGB_G_
    1
    ;; uint8 _RGB_B_
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _RGB_M_
       (write-byte _RGB_M_ s)
     ;; int8 _RGB_S_
       (write-byte _RGB_S_ s)
     ;; uint8 _RGB_T_
       (write-byte _RGB_T_ s)
     ;; uint8 _RGB_R_
       (write-byte _RGB_R_ s)
     ;; uint8 _RGB_G_
       (write-byte _RGB_G_ s)
     ;; uint8 _RGB_B_
       (write-byte _RGB_B_ s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _RGB_M_
     (setq _RGB_M_ (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _RGB_M_ 127) (setq _RGB_M_ (- _RGB_M_ 256)))
   ;; int8 _RGB_S_
     (setq _RGB_S_ (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _RGB_S_ 127) (setq _RGB_S_ (- _RGB_S_ 256)))
   ;; uint8 _RGB_T_
     (setq _RGB_T_ (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RGB_R_
     (setq _RGB_R_ (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RGB_G_
     (setq _RGB_G_ (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _RGB_B_
     (setq _RGB_B_ (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass light_service::Light_SetResponse
  :super ros::object
  :slots (_result ))

(defmethod light_service::Light_SetResponse
  (:init
   (&key
    ((:result __result) "")
    )
   (send-super :init)
   (setq _result (string __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass light_service::Light_Set
  :super ros::object
  :slots ())

(setf (get light_service::Light_Set :md5sum-) "cfc723b899523d9fb55d7d41b0cedf61")
(setf (get light_service::Light_Set :datatype-) "light_service/Light_Set")
(setf (get light_service::Light_Set :request) light_service::Light_SetRequest)
(setf (get light_service::Light_Set :response) light_service::Light_SetResponse)

(defmethod light_service::Light_SetRequest
  (:response () (instance light_service::Light_SetResponse :init)))

(setf (get light_service::Light_SetRequest :md5sum-) "cfc723b899523d9fb55d7d41b0cedf61")
(setf (get light_service::Light_SetRequest :datatype-) "light_service/Light_SetRequest")
(setf (get light_service::Light_SetRequest :definition-)
      "# 客户端请求时发送的两个数字
int8 RGB_M_
int8 RGB_S_
uint8 RGB_T_
uint8 RGB_R_
uint8 RGB_G_
uint8 RGB_B_
---
# 服务器响应发送的数据
string result
")

(setf (get light_service::Light_SetResponse :md5sum-) "cfc723b899523d9fb55d7d41b0cedf61")
(setf (get light_service::Light_SetResponse :datatype-) "light_service/Light_SetResponse")
(setf (get light_service::Light_SetResponse :definition-)
      "# 客户端请求时发送的两个数字
int8 RGB_M_
int8 RGB_S_
uint8 RGB_T_
uint8 RGB_R_
uint8 RGB_G_
uint8 RGB_B_
---
# 服务器响应发送的数据
string result
")



(provide :light_service/Light_Set "cfc723b899523d9fb55d7d41b0cedf61")


