; Auto-generated. Do not edit!


(cl:in-package skeleton_follow-msg)


;//! \htmlinclude astra_sdk_maskdata.msg.html

(cl:defclass <astra_sdk_maskdata> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:integer)
   :initform (cl:make-array 76800 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass astra_sdk_maskdata (<astra_sdk_maskdata>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <astra_sdk_maskdata>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'astra_sdk_maskdata)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name skeleton_follow-msg:<astra_sdk_maskdata> is deprecated: use skeleton_follow-msg:astra_sdk_maskdata instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <astra_sdk_maskdata>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:data-val is deprecated.  Use skeleton_follow-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <astra_sdk_maskdata>) ostream)
  "Serializes a message object of type '<astra_sdk_maskdata>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <astra_sdk_maskdata>) istream)
  "Deserializes a message object of type '<astra_sdk_maskdata>"
  (cl:setf (cl:slot-value msg 'data) (cl:make-array 76800))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i 76800)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<astra_sdk_maskdata>)))
  "Returns string type for a message object of type '<astra_sdk_maskdata>"
  "skeleton_follow/astra_sdk_maskdata")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'astra_sdk_maskdata)))
  "Returns string type for a message object of type 'astra_sdk_maskdata"
  "skeleton_follow/astra_sdk_maskdata")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<astra_sdk_maskdata>)))
  "Returns md5sum for a message object of type '<astra_sdk_maskdata>"
  "83e374be3f0eff604357f0d088c7c236")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'astra_sdk_maskdata)))
  "Returns md5sum for a message object of type 'astra_sdk_maskdata"
  "83e374be3f0eff604357f0d088c7c236")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<astra_sdk_maskdata>)))
  "Returns full string definition for message of type '<astra_sdk_maskdata>"
  (cl:format cl:nil "int32[76800] data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'astra_sdk_maskdata)))
  "Returns full string definition for message of type 'astra_sdk_maskdata"
  (cl:format cl:nil "int32[76800] data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <astra_sdk_maskdata>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <astra_sdk_maskdata>))
  "Converts a ROS message object to a list"
  (cl:list 'astra_sdk_maskdata
    (cl:cons ':data (data msg))
))
