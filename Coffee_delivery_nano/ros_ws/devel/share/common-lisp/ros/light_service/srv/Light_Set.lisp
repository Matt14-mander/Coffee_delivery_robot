; Auto-generated. Do not edit!


(cl:in-package light_service-srv)


;//! \htmlinclude Light_Set-request.msg.html

(cl:defclass <Light_Set-request> (roslisp-msg-protocol:ros-message)
  ((RGB_M_
    :reader RGB_M_
    :initarg :RGB_M_
    :type cl:fixnum
    :initform 0)
   (RGB_S_
    :reader RGB_S_
    :initarg :RGB_S_
    :type cl:fixnum
    :initform 0)
   (RGB_T_
    :reader RGB_T_
    :initarg :RGB_T_
    :type cl:fixnum
    :initform 0)
   (RGB_R_
    :reader RGB_R_
    :initarg :RGB_R_
    :type cl:fixnum
    :initform 0)
   (RGB_G_
    :reader RGB_G_
    :initarg :RGB_G_
    :type cl:fixnum
    :initform 0)
   (RGB_B_
    :reader RGB_B_
    :initarg :RGB_B_
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Light_Set-request (<Light_Set-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Light_Set-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Light_Set-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name light_service-srv:<Light_Set-request> is deprecated: use light_service-srv:Light_Set-request instead.")))

(cl:ensure-generic-function 'RGB_M_-val :lambda-list '(m))
(cl:defmethod RGB_M_-val ((m <Light_Set-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader light_service-srv:RGB_M_-val is deprecated.  Use light_service-srv:RGB_M_ instead.")
  (RGB_M_ m))

(cl:ensure-generic-function 'RGB_S_-val :lambda-list '(m))
(cl:defmethod RGB_S_-val ((m <Light_Set-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader light_service-srv:RGB_S_-val is deprecated.  Use light_service-srv:RGB_S_ instead.")
  (RGB_S_ m))

(cl:ensure-generic-function 'RGB_T_-val :lambda-list '(m))
(cl:defmethod RGB_T_-val ((m <Light_Set-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader light_service-srv:RGB_T_-val is deprecated.  Use light_service-srv:RGB_T_ instead.")
  (RGB_T_ m))

(cl:ensure-generic-function 'RGB_R_-val :lambda-list '(m))
(cl:defmethod RGB_R_-val ((m <Light_Set-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader light_service-srv:RGB_R_-val is deprecated.  Use light_service-srv:RGB_R_ instead.")
  (RGB_R_ m))

(cl:ensure-generic-function 'RGB_G_-val :lambda-list '(m))
(cl:defmethod RGB_G_-val ((m <Light_Set-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader light_service-srv:RGB_G_-val is deprecated.  Use light_service-srv:RGB_G_ instead.")
  (RGB_G_ m))

(cl:ensure-generic-function 'RGB_B_-val :lambda-list '(m))
(cl:defmethod RGB_B_-val ((m <Light_Set-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader light_service-srv:RGB_B_-val is deprecated.  Use light_service-srv:RGB_B_ instead.")
  (RGB_B_ m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Light_Set-request>) ostream)
  "Serializes a message object of type '<Light_Set-request>"
  (cl:let* ((signed (cl:slot-value msg 'RGB_M_)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'RGB_S_)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RGB_T_)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RGB_R_)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RGB_G_)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RGB_B_)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Light_Set-request>) istream)
  "Deserializes a message object of type '<Light_Set-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'RGB_M_) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'RGB_S_) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RGB_T_)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RGB_R_)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RGB_G_)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'RGB_B_)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Light_Set-request>)))
  "Returns string type for a service object of type '<Light_Set-request>"
  "light_service/Light_SetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Light_Set-request)))
  "Returns string type for a service object of type 'Light_Set-request"
  "light_service/Light_SetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Light_Set-request>)))
  "Returns md5sum for a message object of type '<Light_Set-request>"
  "cfc723b899523d9fb55d7d41b0cedf61")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Light_Set-request)))
  "Returns md5sum for a message object of type 'Light_Set-request"
  "cfc723b899523d9fb55d7d41b0cedf61")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Light_Set-request>)))
  "Returns full string definition for message of type '<Light_Set-request>"
  (cl:format cl:nil "# 客户端请求时发送的两个数字~%int8 RGB_M_~%int8 RGB_S_~%uint8 RGB_T_~%uint8 RGB_R_~%uint8 RGB_G_~%uint8 RGB_B_~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Light_Set-request)))
  "Returns full string definition for message of type 'Light_Set-request"
  (cl:format cl:nil "# 客户端请求时发送的两个数字~%int8 RGB_M_~%int8 RGB_S_~%uint8 RGB_T_~%uint8 RGB_R_~%uint8 RGB_G_~%uint8 RGB_B_~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Light_Set-request>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Light_Set-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Light_Set-request
    (cl:cons ':RGB_M_ (RGB_M_ msg))
    (cl:cons ':RGB_S_ (RGB_S_ msg))
    (cl:cons ':RGB_T_ (RGB_T_ msg))
    (cl:cons ':RGB_R_ (RGB_R_ msg))
    (cl:cons ':RGB_G_ (RGB_G_ msg))
    (cl:cons ':RGB_B_ (RGB_B_ msg))
))
;//! \htmlinclude Light_Set-response.msg.html

(cl:defclass <Light_Set-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass Light_Set-response (<Light_Set-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Light_Set-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Light_Set-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name light_service-srv:<Light_Set-response> is deprecated: use light_service-srv:Light_Set-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Light_Set-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader light_service-srv:result-val is deprecated.  Use light_service-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Light_Set-response>) ostream)
  "Serializes a message object of type '<Light_Set-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Light_Set-response>) istream)
  "Deserializes a message object of type '<Light_Set-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'result) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Light_Set-response>)))
  "Returns string type for a service object of type '<Light_Set-response>"
  "light_service/Light_SetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Light_Set-response)))
  "Returns string type for a service object of type 'Light_Set-response"
  "light_service/Light_SetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Light_Set-response>)))
  "Returns md5sum for a message object of type '<Light_Set-response>"
  "cfc723b899523d9fb55d7d41b0cedf61")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Light_Set-response)))
  "Returns md5sum for a message object of type 'Light_Set-response"
  "cfc723b899523d9fb55d7d41b0cedf61")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Light_Set-response>)))
  "Returns full string definition for message of type '<Light_Set-response>"
  (cl:format cl:nil "# 服务器响应发送的数据~%string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Light_Set-response)))
  "Returns full string definition for message of type 'Light_Set-response"
  (cl:format cl:nil "# 服务器响应发送的数据~%string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Light_Set-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Light_Set-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Light_Set-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Light_Set)))
  'Light_Set-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Light_Set)))
  'Light_Set-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Light_Set)))
  "Returns string type for a service object of type '<Light_Set>"
  "light_service/Light_Set")