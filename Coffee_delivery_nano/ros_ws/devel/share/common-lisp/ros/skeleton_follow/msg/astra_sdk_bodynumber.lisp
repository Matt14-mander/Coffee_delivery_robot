; Auto-generated. Do not edit!


(cl:in-package skeleton_follow-msg)


;//! \htmlinclude astra_sdk_bodynumber.msg.html

(cl:defclass <astra_sdk_bodynumber> (roslisp-msg-protocol:ros-message)
  ((count
    :reader count
    :initarg :count
    :type cl:fixnum
    :initform 0)
   (bodies
    :reader bodies
    :initarg :bodies
    :type (cl:vector skeleton_follow-msg:astra_sdk_body)
   :initform (cl:make-array 6 :element-type 'skeleton_follow-msg:astra_sdk_body :initial-element (cl:make-instance 'skeleton_follow-msg:astra_sdk_body))))
)

(cl:defclass astra_sdk_bodynumber (<astra_sdk_bodynumber>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <astra_sdk_bodynumber>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'astra_sdk_bodynumber)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name skeleton_follow-msg:<astra_sdk_bodynumber> is deprecated: use skeleton_follow-msg:astra_sdk_bodynumber instead.")))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <astra_sdk_bodynumber>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:count-val is deprecated.  Use skeleton_follow-msg:count instead.")
  (count m))

(cl:ensure-generic-function 'bodies-val :lambda-list '(m))
(cl:defmethod bodies-val ((m <astra_sdk_bodynumber>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:bodies-val is deprecated.  Use skeleton_follow-msg:bodies instead.")
  (bodies m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <astra_sdk_bodynumber>) ostream)
  "Serializes a message object of type '<astra_sdk_bodynumber>"
  (cl:let* ((signed (cl:slot-value msg 'count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bodies))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <astra_sdk_bodynumber>) istream)
  "Deserializes a message object of type '<astra_sdk_bodynumber>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:setf (cl:slot-value msg 'bodies) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'bodies)))
    (cl:dotimes (i 6)
    (cl:setf (cl:aref vals i) (cl:make-instance 'skeleton_follow-msg:astra_sdk_body))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<astra_sdk_bodynumber>)))
  "Returns string type for a message object of type '<astra_sdk_bodynumber>"
  "skeleton_follow/astra_sdk_bodynumber")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'astra_sdk_bodynumber)))
  "Returns string type for a message object of type 'astra_sdk_bodynumber"
  "skeleton_follow/astra_sdk_bodynumber")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<astra_sdk_bodynumber>)))
  "Returns md5sum for a message object of type '<astra_sdk_bodynumber>"
  "a1b1dea345dbea1f84926cdcaf9c5b80")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'astra_sdk_bodynumber)))
  "Returns md5sum for a message object of type 'astra_sdk_bodynumber"
  "a1b1dea345dbea1f84926cdcaf9c5b80")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<astra_sdk_bodynumber>)))
  "Returns full string definition for message of type '<astra_sdk_bodynumber>"
  (cl:format cl:nil "int8 count~%astra_sdk_body[6] bodies~%================================================================================~%MSG: skeleton_follow/astra_sdk_body~%int16 bodyid~%astra_sdk_vector3f centerOfMass~%astra_sdk_joint[19] joints~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector3f~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: skeleton_follow/astra_sdk_joint~%int8 type~%astra_sdk_vector2f depthPosition~%astra_sdk_vector3f worldPosition~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector2f~%float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'astra_sdk_bodynumber)))
  "Returns full string definition for message of type 'astra_sdk_bodynumber"
  (cl:format cl:nil "int8 count~%astra_sdk_body[6] bodies~%================================================================================~%MSG: skeleton_follow/astra_sdk_body~%int16 bodyid~%astra_sdk_vector3f centerOfMass~%astra_sdk_joint[19] joints~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector3f~%float32 x~%float32 y~%float32 z~%================================================================================~%MSG: skeleton_follow/astra_sdk_joint~%int8 type~%astra_sdk_vector2f depthPosition~%astra_sdk_vector3f worldPosition~%================================================================================~%MSG: skeleton_follow/astra_sdk_vector2f~%float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <astra_sdk_bodynumber>))
  (cl:+ 0
     1
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'bodies) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <astra_sdk_bodynumber>))
  "Converts a ROS message object to a list"
  (cl:list 'astra_sdk_bodynumber
    (cl:cons ':count (count msg))
    (cl:cons ':bodies (bodies msg))
))
