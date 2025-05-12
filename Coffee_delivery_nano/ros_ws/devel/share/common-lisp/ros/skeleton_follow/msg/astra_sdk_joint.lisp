; Auto-generated. Do not edit!


(cl:in-package skeleton_follow-msg)


;//! \htmlinclude astra_sdk_joint.msg.html

(cl:defclass <astra_sdk_joint> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (depthPosition
    :reader depthPosition
    :initarg :depthPosition
    :type skeleton_follow-msg:astra_sdk_vector2f
    :initform (cl:make-instance 'skeleton_follow-msg:astra_sdk_vector2f))
   (worldPosition
    :reader worldPosition
    :initarg :worldPosition
    :type skeleton_follow-msg:astra_sdk_vector3f
    :initform (cl:make-instance 'skeleton_follow-msg:astra_sdk_vector3f)))
)

(cl:defclass astra_sdk_joint (<astra_sdk_joint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <astra_sdk_joint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'astra_sdk_joint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name skeleton_follow-msg:<astra_sdk_joint> is deprecated: use skeleton_follow-msg:astra_sdk_joint instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <astra_sdk_joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:type-val is deprecated.  Use skeleton_follow-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'depthPosition-val :lambda-list '(m))
(cl:defmethod depthPosition-val ((m <astra_sdk_joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:depthPosition-val is deprecated.  Use skeleton_follow-msg:depthPosition instead.")
  (depthPosition m))

(cl:ensure-generic-function 'worldPosition-val :lambda-list '(m))
(cl:defmethod worldPosition-val ((m <astra_sdk_joint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:worldPosition-val is deprecated.  Use skeleton_follow-msg:worldPosition instead.")
  (worldPosition m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <astra_sdk_joint>) ostream)
  "Serializes a message object of type '<astra_sdk_joint>"
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'depthPosition) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'worldPosition) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <astra_sdk_joint>) istream)
  "Deserializes a message object of type '<astra_sdk_joint>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'depthPosition) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'worldPosition) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<astra_sdk_joint>)))
  "Returns string type for a message object of type '<astra_sdk_joint>"
  "skeleton_follow/astra_sdk_joint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'astra_sdk_joint)))
  "Returns string type for a message object of type 'astra_sdk_joint"
  "skeleton_follow/astra_sdk_joint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<astra_sdk_joint>)))
  "Returns md5sum for a message object of type '<astra_sdk_joint>"
  "e4de40bc4d9da2df315d3755d4261051")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'astra_sdk_joint)))
  "Returns md5sum for a message object of type 'astra_sdk_joint"
  "e4de40bc4d9da2df315d3755d4261051")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<astra_sdk_joint>)))
  "Returns full string definition for message of type '<astra_sdk_joint>"
  (cl:format cl:nil "int8 type~%astra_sdk_vector2f depthPosition~%astra_sdk_vector3f worldPosition~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector2f~%float32 x~%float32 y~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector3f~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'astra_sdk_joint)))
  "Returns full string definition for message of type 'astra_sdk_joint"
  (cl:format cl:nil "int8 type~%astra_sdk_vector2f depthPosition~%astra_sdk_vector3f worldPosition~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector2f~%float32 x~%float32 y~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector3f~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <astra_sdk_joint>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'depthPosition))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'worldPosition))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <astra_sdk_joint>))
  "Converts a ROS message object to a list"
  (cl:list 'astra_sdk_joint
    (cl:cons ':type (type msg))
    (cl:cons ':depthPosition (depthPosition msg))
    (cl:cons ':worldPosition (worldPosition msg))
))
