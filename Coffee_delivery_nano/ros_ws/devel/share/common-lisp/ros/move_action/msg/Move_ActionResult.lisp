; Auto-generated. Do not edit!


(cl:in-package move_action-msg)


;//! \htmlinclude Move_ActionResult.msg.html

(cl:defclass <Move_ActionResult> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:string
    :initform ""))
)

(cl:defclass Move_ActionResult (<Move_ActionResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Move_ActionResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Move_ActionResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_action-msg:<Move_ActionResult> is deprecated: use move_action-msg:Move_ActionResult instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Move_ActionResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_action-msg:result-val is deprecated.  Use move_action-msg:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Move_ActionResult>) ostream)
  "Serializes a message object of type '<Move_ActionResult>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'result))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'result))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Move_ActionResult>) istream)
  "Deserializes a message object of type '<Move_ActionResult>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Move_ActionResult>)))
  "Returns string type for a message object of type '<Move_ActionResult>"
  "move_action/Move_ActionResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Move_ActionResult)))
  "Returns string type for a message object of type 'Move_ActionResult"
  "move_action/Move_ActionResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Move_ActionResult>)))
  "Returns md5sum for a message object of type '<Move_ActionResult>"
  "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Move_ActionResult)))
  "Returns md5sum for a message object of type 'Move_ActionResult"
  "c22f2a1ed8654a0b365f1bb3f7ff2c0f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Move_ActionResult>)))
  "Returns full string definition for message of type '<Move_ActionResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#最终结果~%string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Move_ActionResult)))
  "Returns full string definition for message of type 'Move_ActionResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#最终结果~%string result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Move_ActionResult>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'result))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Move_ActionResult>))
  "Converts a ROS message object to a list"
  (cl:list 'Move_ActionResult
    (cl:cons ':result (result msg))
))
