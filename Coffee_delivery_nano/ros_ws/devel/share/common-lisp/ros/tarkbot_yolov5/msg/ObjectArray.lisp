; Auto-generated. Do not edit!


(cl:in-package tarkbot_yolov5-msg)


;//! \htmlinclude ObjectArray.msg.html

(cl:defclass <ObjectArray> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector tarkbot_yolov5-msg:Object)
   :initform (cl:make-array 0 :element-type 'tarkbot_yolov5-msg:Object :initial-element (cl:make-instance 'tarkbot_yolov5-msg:Object))))
)

(cl:defclass ObjectArray (<ObjectArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjectArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjectArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tarkbot_yolov5-msg:<ObjectArray> is deprecated: use tarkbot_yolov5-msg:ObjectArray instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <ObjectArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_yolov5-msg:data-val is deprecated.  Use tarkbot_yolov5-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjectArray>) ostream)
  "Serializes a message object of type '<ObjectArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjectArray>) istream)
  "Deserializes a message object of type '<ObjectArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tarkbot_yolov5-msg:Object))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjectArray>)))
  "Returns string type for a message object of type '<ObjectArray>"
  "tarkbot_yolov5/ObjectArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjectArray)))
  "Returns string type for a message object of type 'ObjectArray"
  "tarkbot_yolov5/ObjectArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjectArray>)))
  "Returns md5sum for a message object of type '<ObjectArray>"
  "5c74c52b301e4b25679f3941c4f6f23f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjectArray)))
  "Returns md5sum for a message object of type 'ObjectArray"
  "5c74c52b301e4b25679f3941c4f6f23f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjectArray>)))
  "Returns full string definition for message of type '<ObjectArray>"
  (cl:format cl:nil "tarkbot_yolov5/Object[] data~%~%================================================================================~%MSG: tarkbot_yolov5/Object~%string frame_id~%time stamp~%float32 scores~%float32 ptx~%float32 pty~%float32 distw~%float32 disth~%float32 centerx~%float32 centery~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjectArray)))
  "Returns full string definition for message of type 'ObjectArray"
  (cl:format cl:nil "tarkbot_yolov5/Object[] data~%~%================================================================================~%MSG: tarkbot_yolov5/Object~%string frame_id~%time stamp~%float32 scores~%float32 ptx~%float32 pty~%float32 distw~%float32 disth~%float32 centerx~%float32 centery~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjectArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjectArray>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjectArray
    (cl:cons ':data (data msg))
))
