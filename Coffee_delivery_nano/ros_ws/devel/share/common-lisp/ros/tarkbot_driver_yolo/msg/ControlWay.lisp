; Auto-generated. Do not edit!


(cl:in-package tarkbot_driver_yolo-msg)


;//! \htmlinclude ControlWay.msg.html

(cl:defclass <ControlWay> (roslisp-msg-protocol:ros-message)
  ((mask_x_left
    :reader mask_x_left
    :initarg :mask_x_left
    :type cl:float
    :initform 0.0)
   (mask_x_right
    :reader mask_x_right
    :initarg :mask_x_right
    :type cl:float
    :initform 0.0)
   (mask_y_top
    :reader mask_y_top
    :initarg :mask_y_top
    :type cl:float
    :initform 0.0)
   (mask_y_bot
    :reader mask_y_bot
    :initarg :mask_y_bot
    :type cl:float
    :initform 0.0)
   (center_target
    :reader center_target
    :initarg :center_target
    :type cl:float
    :initform 0.0)
   (vel_x
    :reader vel_x
    :initarg :vel_x
    :type cl:float
    :initform 0.0)
   (vel_y_P
    :reader vel_y_P
    :initarg :vel_y_P
    :type cl:float
    :initform 0.0)
   (vel_y_D
    :reader vel_y_D
    :initarg :vel_y_D
    :type cl:float
    :initform 0.0)
   (vel_z_P
    :reader vel_z_P
    :initarg :vel_z_P
    :type cl:float
    :initform 0.0)
   (vel_z_D
    :reader vel_z_D
    :initarg :vel_z_D
    :type cl:float
    :initform 0.0)
   (en
    :reader en
    :initarg :en
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ControlWay (<ControlWay>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlWay>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlWay)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tarkbot_driver_yolo-msg:<ControlWay> is deprecated: use tarkbot_driver_yolo-msg:ControlWay instead.")))

(cl:ensure-generic-function 'mask_x_left-val :lambda-list '(m))
(cl:defmethod mask_x_left-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:mask_x_left-val is deprecated.  Use tarkbot_driver_yolo-msg:mask_x_left instead.")
  (mask_x_left m))

(cl:ensure-generic-function 'mask_x_right-val :lambda-list '(m))
(cl:defmethod mask_x_right-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:mask_x_right-val is deprecated.  Use tarkbot_driver_yolo-msg:mask_x_right instead.")
  (mask_x_right m))

(cl:ensure-generic-function 'mask_y_top-val :lambda-list '(m))
(cl:defmethod mask_y_top-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:mask_y_top-val is deprecated.  Use tarkbot_driver_yolo-msg:mask_y_top instead.")
  (mask_y_top m))

(cl:ensure-generic-function 'mask_y_bot-val :lambda-list '(m))
(cl:defmethod mask_y_bot-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:mask_y_bot-val is deprecated.  Use tarkbot_driver_yolo-msg:mask_y_bot instead.")
  (mask_y_bot m))

(cl:ensure-generic-function 'center_target-val :lambda-list '(m))
(cl:defmethod center_target-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:center_target-val is deprecated.  Use tarkbot_driver_yolo-msg:center_target instead.")
  (center_target m))

(cl:ensure-generic-function 'vel_x-val :lambda-list '(m))
(cl:defmethod vel_x-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:vel_x-val is deprecated.  Use tarkbot_driver_yolo-msg:vel_x instead.")
  (vel_x m))

(cl:ensure-generic-function 'vel_y_P-val :lambda-list '(m))
(cl:defmethod vel_y_P-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:vel_y_P-val is deprecated.  Use tarkbot_driver_yolo-msg:vel_y_P instead.")
  (vel_y_P m))

(cl:ensure-generic-function 'vel_y_D-val :lambda-list '(m))
(cl:defmethod vel_y_D-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:vel_y_D-val is deprecated.  Use tarkbot_driver_yolo-msg:vel_y_D instead.")
  (vel_y_D m))

(cl:ensure-generic-function 'vel_z_P-val :lambda-list '(m))
(cl:defmethod vel_z_P-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:vel_z_P-val is deprecated.  Use tarkbot_driver_yolo-msg:vel_z_P instead.")
  (vel_z_P m))

(cl:ensure-generic-function 'vel_z_D-val :lambda-list '(m))
(cl:defmethod vel_z_D-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:vel_z_D-val is deprecated.  Use tarkbot_driver_yolo-msg:vel_z_D instead.")
  (vel_z_D m))

(cl:ensure-generic-function 'en-val :lambda-list '(m))
(cl:defmethod en-val ((m <ControlWay>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tarkbot_driver_yolo-msg:en-val is deprecated.  Use tarkbot_driver_yolo-msg:en instead.")
  (en m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlWay>) ostream)
  "Serializes a message object of type '<ControlWay>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mask_x_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mask_x_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mask_y_top))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mask_y_bot))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'center_target))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_y_P))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_y_D))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_z_P))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_z_D))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'en)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlWay>) istream)
  "Deserializes a message object of type '<ControlWay>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mask_x_left) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mask_x_right) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mask_y_top) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mask_y_bot) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'center_target) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_y_P) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_y_D) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_z_P) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_z_D) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'en) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlWay>)))
  "Returns string type for a message object of type '<ControlWay>"
  "tarkbot_driver_yolo/ControlWay")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlWay)))
  "Returns string type for a message object of type 'ControlWay"
  "tarkbot_driver_yolo/ControlWay")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlWay>)))
  "Returns md5sum for a message object of type '<ControlWay>"
  "8c848fda070f270966c6dcd98dd08d58")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlWay)))
  "Returns md5sum for a message object of type 'ControlWay"
  "8c848fda070f270966c6dcd98dd08d58")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlWay>)))
  "Returns full string definition for message of type '<ControlWay>"
  (cl:format cl:nil "float32 mask_x_left~%~%float32 mask_x_right~%~%float32 mask_y_top~%~%float32 mask_y_bot~%~%float32 center_target~%~%float32 vel_x~%~%float32 vel_y_P~%~%float32 vel_y_D~%~%float32 vel_z_P~%~%float32 vel_z_D~%~%int8 en~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlWay)))
  "Returns full string definition for message of type 'ControlWay"
  (cl:format cl:nil "float32 mask_x_left~%~%float32 mask_x_right~%~%float32 mask_y_top~%~%float32 mask_y_bot~%~%float32 center_target~%~%float32 vel_x~%~%float32 vel_y_P~%~%float32 vel_y_D~%~%float32 vel_z_P~%~%float32 vel_z_D~%~%int8 en~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlWay>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlWay>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlWay
    (cl:cons ':mask_x_left (mask_x_left msg))
    (cl:cons ':mask_x_right (mask_x_right msg))
    (cl:cons ':mask_y_top (mask_y_top msg))
    (cl:cons ':mask_y_bot (mask_y_bot msg))
    (cl:cons ':center_target (center_target msg))
    (cl:cons ':vel_x (vel_x msg))
    (cl:cons ':vel_y_P (vel_y_P msg))
    (cl:cons ':vel_y_D (vel_y_D msg))
    (cl:cons ':vel_z_P (vel_z_P msg))
    (cl:cons ':vel_z_D (vel_z_D msg))
    (cl:cons ':en (en msg))
))
