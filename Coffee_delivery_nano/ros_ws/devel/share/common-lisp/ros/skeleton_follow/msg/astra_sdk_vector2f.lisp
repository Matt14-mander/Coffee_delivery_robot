; Auto-generated. Do not edit!


(cl:in-package skeleton_follow-msg)


;//! \htmlinclude astra_sdk_vector2f.msg.html

(cl:defclass <astra_sdk_vector2f> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass astra_sdk_vector2f (<astra_sdk_vector2f>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <astra_sdk_vector2f>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'astra_sdk_vector2f)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name skeleton_follow-msg:<astra_sdk_vector2f> is deprecated: use skeleton_follow-msg:astra_sdk_vector2f instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <astra_sdk_vector2f>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:x-val is deprecated.  Use skeleton_follow-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <astra_sdk_vector2f>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:y-val is deprecated.  Use skeleton_follow-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <astra_sdk_vector2f>) ostream)
  "Serializes a message object of type '<astra_sdk_vector2f>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <astra_sdk_vector2f>) istream)
  "Deserializes a message object of type '<astra_sdk_vector2f>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<astra_sdk_vector2f>)))
  "Returns string type for a message object of type '<astra_sdk_vector2f>"
  "skeleton_follow/astra_sdk_vector2f")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'astra_sdk_vector2f)))
  "Returns string type for a message object of type 'astra_sdk_vector2f"
  "skeleton_follow/astra_sdk_vector2f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<astra_sdk_vector2f>)))
  "Returns md5sum for a message object of type '<astra_sdk_vector2f>"
  "ff8d7d66dd3e4b731ef14a45d38888b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'astra_sdk_vector2f)))
  "Returns md5sum for a message object of type 'astra_sdk_vector2f"
  "ff8d7d66dd3e4b731ef14a45d38888b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<astra_sdk_vector2f>)))
  "Returns full string definition for message of type '<astra_sdk_vector2f>"
  (cl:format cl:nil "float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'astra_sdk_vector2f)))
  "Returns full string definition for message of type 'astra_sdk_vector2f"
  (cl:format cl:nil "float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <astra_sdk_vector2f>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <astra_sdk_vector2f>))
  "Converts a ROS message object to a list"
  (cl:list 'astra_sdk_vector2f
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
