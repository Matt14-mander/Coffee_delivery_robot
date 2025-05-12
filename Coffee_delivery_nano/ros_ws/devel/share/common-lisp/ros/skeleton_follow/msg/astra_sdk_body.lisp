; Auto-generated. Do not edit!


(cl:in-package skeleton_follow-msg)


;//! \htmlinclude astra_sdk_body.msg.html

(cl:defclass <astra_sdk_body> (roslisp-msg-protocol:ros-message)
  ((bodyid
    :reader bodyid
    :initarg :bodyid
    :type cl:fixnum
    :initform 0)
   (centerOfMass
    :reader centerOfMass
    :initarg :centerOfMass
    :type skeleton_follow-msg:astra_sdk_vector3f
    :initform (cl:make-instance 'skeleton_follow-msg:astra_sdk_vector3f))
   (joints
    :reader joints
    :initarg :joints
    :type (cl:vector skeleton_follow-msg:astra_sdk_joint)
   :initform (cl:make-array 19 :element-type 'skeleton_follow-msg:astra_sdk_joint :initial-element (cl:make-instance 'skeleton_follow-msg:astra_sdk_joint))))
)

(cl:defclass astra_sdk_body (<astra_sdk_body>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <astra_sdk_body>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'astra_sdk_body)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name skeleton_follow-msg:<astra_sdk_body> is deprecated: use skeleton_follow-msg:astra_sdk_body instead.")))

(cl:ensure-generic-function 'bodyid-val :lambda-list '(m))
(cl:defmethod bodyid-val ((m <astra_sdk_body>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:bodyid-val is deprecated.  Use skeleton_follow-msg:bodyid instead.")
  (bodyid m))

(cl:ensure-generic-function 'centerOfMass-val :lambda-list '(m))
(cl:defmethod centerOfMass-val ((m <astra_sdk_body>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:centerOfMass-val is deprecated.  Use skeleton_follow-msg:centerOfMass instead.")
  (centerOfMass m))

(cl:ensure-generic-function 'joints-val :lambda-list '(m))
(cl:defmethod joints-val ((m <astra_sdk_body>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:joints-val is deprecated.  Use skeleton_follow-msg:joints instead.")
  (joints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <astra_sdk_body>) ostream)
  "Serializes a message object of type '<astra_sdk_body>"
  (cl:let* ((signed (cl:slot-value msg 'bodyid)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'centerOfMass) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <astra_sdk_body>) istream)
  "Deserializes a message object of type '<astra_sdk_body>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bodyid) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'centerOfMass) istream)
  (cl:setf (cl:slot-value msg 'joints) (cl:make-array 19))
  (cl:let ((vals (cl:slot-value msg 'joints)))
    (cl:dotimes (i 19)
    (cl:setf (cl:aref vals i) (cl:make-instance 'skeleton_follow-msg:astra_sdk_joint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<astra_sdk_body>)))
  "Returns string type for a message object of type '<astra_sdk_body>"
  "skeleton_follow/astra_sdk_body")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'astra_sdk_body)))
  "Returns string type for a message object of type 'astra_sdk_body"
  "skeleton_follow/astra_sdk_body")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<astra_sdk_body>)))
  "Returns md5sum for a message object of type '<astra_sdk_body>"
  "57f2da357721aaca7548e8de3d97f76a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'astra_sdk_body)))
  "Returns md5sum for a message object of type 'astra_sdk_body"
  "57f2da357721aaca7548e8de3d97f76a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<astra_sdk_body>)))
  "Returns full string definition for message of type '<astra_sdk_body>"
  (cl:format cl:nil "int16 bodyid~%astra_sdk_vector3f centerOfMass~%astra_sdk_joint[19] joints~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector3f~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: skeleton_follow/astra_sdk_joint~%int8 type~%astra_sdk_vector2f depthPosition~%astra_sdk_vector3f worldPosition~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector2f~%float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'astra_sdk_body)))
  "Returns full string definition for message of type 'astra_sdk_body"
  (cl:format cl:nil "int16 bodyid~%astra_sdk_vector3f centerOfMass~%astra_sdk_joint[19] joints~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector3f~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: skeleton_follow/astra_sdk_joint~%int8 type~%astra_sdk_vector2f depthPosition~%astra_sdk_vector3f worldPosition~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector2f~%float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <astra_sdk_body>))
  (cl:+ 0
     2
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'centerOfMass))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'joints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <astra_sdk_body>))
  "Converts a ROS message object to a list"
  (cl:list 'astra_sdk_body
    (cl:cons ':bodyid (bodyid msg))
    (cl:cons ':centerOfMass (centerOfMass msg))
    (cl:cons ':joints (joints msg))
))
