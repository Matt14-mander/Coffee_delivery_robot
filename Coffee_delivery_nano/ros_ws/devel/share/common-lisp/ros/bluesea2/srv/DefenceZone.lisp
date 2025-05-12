; Auto-generated. Do not edit!


(cl:in-package bluesea2-srv)


;//! \htmlinclude DefenceZone-request.msg.html

(cl:defclass <DefenceZone-request> (roslisp-msg-protocol:ros-message)
  ((index
    :reader index
    :initarg :index
    :type cl:integer
    :initform 0)
   (ip
    :reader ip
    :initarg :ip
    :type cl:string
    :initform ""))
)

(cl:defclass DefenceZone-request (<DefenceZone-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DefenceZone-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DefenceZone-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bluesea2-srv:<DefenceZone-request> is deprecated: use bluesea2-srv:DefenceZone-request instead.")))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <DefenceZone-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bluesea2-srv:index-val is deprecated.  Use bluesea2-srv:index instead.")
  (index m))

(cl:ensure-generic-function 'ip-val :lambda-list '(m))
(cl:defmethod ip-val ((m <DefenceZone-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader bluesea2-srv:ip-val is deprecated.  Use bluesea2-srv:ip instead.")
  (ip m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DefenceZone-request>) ostream)
  "Serializes a message object of type '<DefenceZone-request>"
  (cl:let* ((signed (cl:slot-value msg 'index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'ip))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'ip))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DefenceZone-request>) istream)
  "Deserializes a message object of type '<DefenceZone-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ip) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'ip) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DefenceZone-request>)))
  "Returns string type for a service object of type '<DefenceZone-request>"
  "bluesea2/DefenceZoneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DefenceZone-request)))
  "Returns string type for a service object of type 'DefenceZone-request"
  "bluesea2/DefenceZoneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DefenceZone-request>)))
  "Returns md5sum for a message object of type '<DefenceZone-request>"
  "e59dcc27f1124e7929b888c8823d5573")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DefenceZone-request)))
  "Returns md5sum for a message object of type 'DefenceZone-request"
  "e59dcc27f1124e7929b888c8823d5573")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DefenceZone-request>)))
  "Returns full string definition for message of type '<DefenceZone-request>"
  (cl:format cl:nil "int32 index~%string ip~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DefenceZone-request)))
  "Returns full string definition for message of type 'DefenceZone-request"
  (cl:format cl:nil "int32 index~%string ip~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DefenceZone-request>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'ip))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DefenceZone-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DefenceZone-request
    (cl:cons ':index (index msg))
    (cl:cons ':ip (ip msg))
))
;//! \htmlinclude DefenceZone-response.msg.html

(cl:defclass <DefenceZone-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass DefenceZone-response (<DefenceZone-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DefenceZone-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DefenceZone-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name bluesea2-srv:<DefenceZone-response> is deprecated: use bluesea2-srv:DefenceZone-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DefenceZone-response>) ostream)
  "Serializes a message object of type '<DefenceZone-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DefenceZone-response>) istream)
  "Deserializes a message object of type '<DefenceZone-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DefenceZone-response>)))
  "Returns string type for a service object of type '<DefenceZone-response>"
  "bluesea2/DefenceZoneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DefenceZone-response)))
  "Returns string type for a service object of type 'DefenceZone-response"
  "bluesea2/DefenceZoneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DefenceZone-response>)))
  "Returns md5sum for a message object of type '<DefenceZone-response>"
  "e59dcc27f1124e7929b888c8823d5573")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DefenceZone-response)))
  "Returns md5sum for a message object of type 'DefenceZone-response"
  "e59dcc27f1124e7929b888c8823d5573")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DefenceZone-response>)))
  "Returns full string definition for message of type '<DefenceZone-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DefenceZone-response)))
  "Returns full string definition for message of type 'DefenceZone-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DefenceZone-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DefenceZone-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DefenceZone-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DefenceZone)))
  'DefenceZone-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DefenceZone)))
  'DefenceZone-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DefenceZone)))
  "Returns string type for a service object of type '<DefenceZone>"
  "bluesea2/DefenceZone")