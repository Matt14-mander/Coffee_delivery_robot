; Auto-generated. Do not edit!


(cl:in-package xtlidar_ros-srv)


;//! \htmlinclude Control-request.msg.html

(cl:defclass <Control-request> (roslisp-msg-protocol:ros-message)
  ((index
    :reader index
    :initarg :index
    :type cl:integer
    :initform 0))
)

(cl:defclass Control-request (<Control-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Control-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Control-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xtlidar_ros-srv:<Control-request> is deprecated: use xtlidar_ros-srv:Control-request instead.")))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <Control-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xtlidar_ros-srv:index-val is deprecated.  Use xtlidar_ros-srv:index instead.")
  (index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Control-request>) ostream)
  "Serializes a message object of type '<Control-request>"
  (cl:let* ((signed (cl:slot-value msg 'index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Control-request>) istream)
  "Deserializes a message object of type '<Control-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'index) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Control-request>)))
  "Returns string type for a service object of type '<Control-request>"
  "xtlidar_ros/ControlRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control-request)))
  "Returns string type for a service object of type 'Control-request"
  "xtlidar_ros/ControlRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Control-request>)))
  "Returns md5sum for a message object of type '<Control-request>"
  "6a92c772b35d41f76733d8eb9779b0e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Control-request)))
  "Returns md5sum for a message object of type 'Control-request"
  "6a92c772b35d41f76733d8eb9779b0e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Control-request>)))
  "Returns full string definition for message of type '<Control-request>"
  (cl:format cl:nil "int64 index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Control-request)))
  "Returns full string definition for message of type 'Control-request"
  (cl:format cl:nil "int64 index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Control-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Control-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Control-request
    (cl:cons ':index (index msg))
))
;//! \htmlinclude Control-response.msg.html

(cl:defclass <Control-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Control-response (<Control-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Control-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Control-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xtlidar_ros-srv:<Control-response> is deprecated: use xtlidar_ros-srv:Control-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Control-response>) ostream)
  "Serializes a message object of type '<Control-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Control-response>) istream)
  "Deserializes a message object of type '<Control-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Control-response>)))
  "Returns string type for a service object of type '<Control-response>"
  "xtlidar_ros/ControlResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control-response)))
  "Returns string type for a service object of type 'Control-response"
  "xtlidar_ros/ControlResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Control-response>)))
  "Returns md5sum for a message object of type '<Control-response>"
  "6a92c772b35d41f76733d8eb9779b0e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Control-response)))
  "Returns md5sum for a message object of type 'Control-response"
  "6a92c772b35d41f76733d8eb9779b0e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Control-response>)))
  "Returns full string definition for message of type '<Control-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Control-response)))
  "Returns full string definition for message of type 'Control-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Control-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Control-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Control-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Control)))
  'Control-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Control)))
  'Control-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Control)))
  "Returns string type for a service object of type '<Control>"
  "xtlidar_ros/Control")