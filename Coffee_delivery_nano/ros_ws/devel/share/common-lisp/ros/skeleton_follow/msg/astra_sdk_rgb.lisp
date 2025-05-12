; Auto-generated. Do not edit!


(cl:in-package skeleton_follow-msg)


;//! \htmlinclude astra_sdk_rgb.msg.html

(cl:defclass <astra_sdk_rgb> (roslisp-msg-protocol:ros-message)
  ((r
    :reader r
    :initarg :r
    :type cl:fixnum
    :initform 0)
   (g
    :reader g
    :initarg :g
    :type cl:fixnum
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:fixnum
    :initform 0))
)

(cl:defclass astra_sdk_rgb (<astra_sdk_rgb>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <astra_sdk_rgb>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'astra_sdk_rgb)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name skeleton_follow-msg:<astra_sdk_rgb> is deprecated: use skeleton_follow-msg:astra_sdk_rgb instead.")))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <astra_sdk_rgb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:r-val is deprecated.  Use skeleton_follow-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'g-val :lambda-list '(m))
(cl:defmethod g-val ((m <astra_sdk_rgb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:g-val is deprecated.  Use skeleton_follow-msg:g instead.")
  (g m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <astra_sdk_rgb>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:b-val is deprecated.  Use skeleton_follow-msg:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <astra_sdk_rgb>) ostream)
  "Serializes a message object of type '<astra_sdk_rgb>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <astra_sdk_rgb>) istream)
  "Deserializes a message object of type '<astra_sdk_rgb>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<astra_sdk_rgb>)))
  "Returns string type for a message object of type '<astra_sdk_rgb>"
  "skeleton_follow/astra_sdk_rgb")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'astra_sdk_rgb)))
  "Returns string type for a message object of type 'astra_sdk_rgb"
  "skeleton_follow/astra_sdk_rgb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<astra_sdk_rgb>)))
  "Returns md5sum for a message object of type '<astra_sdk_rgb>"
  "353891e354491c51aabe32df673fb446")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'astra_sdk_rgb)))
  "Returns md5sum for a message object of type 'astra_sdk_rgb"
  "353891e354491c51aabe32df673fb446")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<astra_sdk_rgb>)))
  "Returns full string definition for message of type '<astra_sdk_rgb>"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'astra_sdk_rgb)))
  "Returns full string definition for message of type 'astra_sdk_rgb"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <astra_sdk_rgb>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <astra_sdk_rgb>))
  "Converts a ROS message object to a list"
  (cl:list 'astra_sdk_rgb
    (cl:cons ':r (r msg))
    (cl:cons ':g (g msg))
    (cl:cons ':b (b msg))
))
