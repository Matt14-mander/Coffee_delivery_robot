; Auto-generated. Do not edit!


(cl:in-package xf_mic_asr_offline-msg)


;//! \htmlinclude Lidar_Angle.msg.html

(cl:defclass <Lidar_Angle> (roslisp-msg-protocol:ros-message)
  ((start_angle
    :reader start_angle
    :initarg :start_angle
    :type cl:fixnum
    :initform 0)
   (end_angle
    :reader end_angle
    :initarg :end_angle
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Lidar_Angle (<Lidar_Angle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Lidar_Angle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Lidar_Angle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xf_mic_asr_offline-msg:<Lidar_Angle> is deprecated: use xf_mic_asr_offline-msg:Lidar_Angle instead.")))

(cl:ensure-generic-function 'start_angle-val :lambda-list '(m))
(cl:defmethod start_angle-val ((m <Lidar_Angle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-msg:start_angle-val is deprecated.  Use xf_mic_asr_offline-msg:start_angle instead.")
  (start_angle m))

(cl:ensure-generic-function 'end_angle-val :lambda-list '(m))
(cl:defmethod end_angle-val ((m <Lidar_Angle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xf_mic_asr_offline-msg:end_angle-val is deprecated.  Use xf_mic_asr_offline-msg:end_angle instead.")
  (end_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Lidar_Angle>) ostream)
  "Serializes a message object of type '<Lidar_Angle>"
  (cl:let* ((signed (cl:slot-value msg 'start_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'end_angle)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Lidar_Angle>) istream)
  "Deserializes a message object of type '<Lidar_Angle>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'end_angle) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Lidar_Angle>)))
  "Returns string type for a message object of type '<Lidar_Angle>"
  "xf_mic_asr_offline/Lidar_Angle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Lidar_Angle)))
  "Returns string type for a message object of type 'Lidar_Angle"
  "xf_mic_asr_offline/Lidar_Angle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Lidar_Angle>)))
  "Returns md5sum for a message object of type '<Lidar_Angle>"
  "2684a80dd6dd0c664a3b5f39f5f7cc9e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Lidar_Angle)))
  "Returns md5sum for a message object of type 'Lidar_Angle"
  "2684a80dd6dd0c664a3b5f39f5f7cc9e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Lidar_Angle>)))
  "Returns full string definition for message of type '<Lidar_Angle>"
  (cl:format cl:nil "int16 start_angle~%int16 end_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Lidar_Angle)))
  "Returns full string definition for message of type 'Lidar_Angle"
  (cl:format cl:nil "int16 start_angle~%int16 end_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Lidar_Angle>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Lidar_Angle>))
  "Converts a ROS message object to a list"
  (cl:list 'Lidar_Angle
    (cl:cons ':start_angle (start_angle msg))
    (cl:cons ':end_angle (end_angle msg))
))
