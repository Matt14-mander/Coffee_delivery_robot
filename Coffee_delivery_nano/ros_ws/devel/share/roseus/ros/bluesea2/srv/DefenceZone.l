;; Auto-generated. Do not edit!


(when (boundp 'bluesea2::DefenceZone)
  (if (not (find-package "BLUESEA2"))
    (make-package "BLUESEA2"))
  (shadow 'DefenceZone (find-package "BLUESEA2")))
(unless (find-package "BLUESEA2::DEFENCEZONE")
  (make-package "BLUESEA2::DEFENCEZONE"))
(unless (find-package "BLUESEA2::DEFENCEZONEREQUEST")
  (make-package "BLUESEA2::DEFENCEZONEREQUEST"))
(unless (find-package "BLUESEA2::DEFENCEZONERESPONSE")
  (make-package "BLUESEA2::DEFENCEZONERESPONSE"))

(in-package "ROS")





(defclass bluesea2::DefenceZoneRequest
  :super ros::object
  :slots (_index _ip ))

(defmethod bluesea2::DefenceZoneRequest
  (:init
   (&key
    ((:index __index) 0)
    ((:ip __ip) "")
    )
   (send-super :init)
   (setq _index (round __index))
   (setq _ip (string __ip))
   self)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:ip
   (&optional __ip)
   (if __ip (setq _ip __ip)) _ip)
  (:serialization-length
   ()
   (+
    ;; int32 _index
    4
    ;; string _ip
    4 (length _ip)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _index
       (write-long _index s)
     ;; string _ip
       (write-long (length _ip) s) (princ _ip s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _index
     (setq _index (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _ip
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _ip (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass bluesea2::DefenceZoneResponse
  :super ros::object
  :slots ())

(defmethod bluesea2::DefenceZoneResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass bluesea2::DefenceZone
  :super ros::object
  :slots ())

(setf (get bluesea2::DefenceZone :md5sum-) "e59dcc27f1124e7929b888c8823d5573")
(setf (get bluesea2::DefenceZone :datatype-) "bluesea2/DefenceZone")
(setf (get bluesea2::DefenceZone :request) bluesea2::DefenceZoneRequest)
(setf (get bluesea2::DefenceZone :response) bluesea2::DefenceZoneResponse)

(defmethod bluesea2::DefenceZoneRequest
  (:response () (instance bluesea2::DefenceZoneResponse :init)))

(setf (get bluesea2::DefenceZoneRequest :md5sum-) "e59dcc27f1124e7929b888c8823d5573")
(setf (get bluesea2::DefenceZoneRequest :datatype-) "bluesea2/DefenceZoneRequest")
(setf (get bluesea2::DefenceZoneRequest :definition-)
      "int32 index
string ip
---
")

(setf (get bluesea2::DefenceZoneResponse :md5sum-) "e59dcc27f1124e7929b888c8823d5573")
(setf (get bluesea2::DefenceZoneResponse :datatype-) "bluesea2/DefenceZoneResponse")
(setf (get bluesea2::DefenceZoneResponse :definition-)
      "int32 index
string ip
---
")



(provide :bluesea2/DefenceZone "e59dcc27f1124e7929b888c8823d5573")


