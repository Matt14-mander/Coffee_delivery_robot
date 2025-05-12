;; Auto-generated. Do not edit!


(when (boundp 'bluesea2::Control)
  (if (not (find-package "BLUESEA2"))
    (make-package "BLUESEA2"))
  (shadow 'Control (find-package "BLUESEA2")))
(unless (find-package "BLUESEA2::CONTROL")
  (make-package "BLUESEA2::CONTROL"))
(unless (find-package "BLUESEA2::CONTROLREQUEST")
  (make-package "BLUESEA2::CONTROLREQUEST"))
(unless (find-package "BLUESEA2::CONTROLRESPONSE")
  (make-package "BLUESEA2::CONTROLRESPONSE"))

(in-package "ROS")





(defclass bluesea2::ControlRequest
  :super ros::object
  :slots (_index ))

(defmethod bluesea2::ControlRequest
  (:init
   (&key
    ((:index __index) 0)
    )
   (send-super :init)
   (setq _index (round __index))
   self)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:serialization-length
   ()
   (+
    ;; int64 _index
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _index
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _index (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _index) (= (length (_index . bv)) 2)) ;; bignum
              (write-long (ash (elt (_index . bv) 0) 0) s)
              (write-long (ash (elt (_index . bv) 1) -1) s))
             ((and (class _index) (= (length (_index . bv)) 1)) ;; big1
              (write-long (elt (_index . bv) 0) s)
              (write-long (if (>= _index 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _index s)(write-long (if (>= _index 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _index
#+(or :alpha :irix6 :x86_64)
      (setf _index (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _index (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass bluesea2::ControlResponse
  :super ros::object
  :slots ())

(defmethod bluesea2::ControlResponse
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

(defclass bluesea2::Control
  :super ros::object
  :slots ())

(setf (get bluesea2::Control :md5sum-) "6a92c772b35d41f76733d8eb9779b0e1")
(setf (get bluesea2::Control :datatype-) "bluesea2/Control")
(setf (get bluesea2::Control :request) bluesea2::ControlRequest)
(setf (get bluesea2::Control :response) bluesea2::ControlResponse)

(defmethod bluesea2::ControlRequest
  (:response () (instance bluesea2::ControlResponse :init)))

(setf (get bluesea2::ControlRequest :md5sum-) "6a92c772b35d41f76733d8eb9779b0e1")
(setf (get bluesea2::ControlRequest :datatype-) "bluesea2/ControlRequest")
(setf (get bluesea2::ControlRequest :definition-)
      "int64 index
---
")

(setf (get bluesea2::ControlResponse :md5sum-) "6a92c772b35d41f76733d8eb9779b0e1")
(setf (get bluesea2::ControlResponse :datatype-) "bluesea2/ControlResponse")
(setf (get bluesea2::ControlResponse :definition-)
      "int64 index
---
")



(provide :bluesea2/Control "6a92c772b35d41f76733d8eb9779b0e1")


