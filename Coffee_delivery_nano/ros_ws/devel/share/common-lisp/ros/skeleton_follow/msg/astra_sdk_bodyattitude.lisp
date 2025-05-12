; Auto-generated. Do not edit!


(cl:in-package skeleton_follow-msg)


;//! \htmlinclude astra_sdk_bodyattitude.msg.html

(cl:defclass <astra_sdk_bodyattitude> (roslisp-msg-protocol:ros-message)
  ((bodyid
    :reader bodyid
    :initarg :bodyid
    :type cl:fixnum
    :initform 0)
   (CenterOfMass_X
    :reader CenterOfMass_X
    :initarg :CenterOfMass_X
    :type cl:float
    :initform 0.0)
   (CenterOfMass_Y
    :reader CenterOfMass_Y
    :initarg :CenterOfMass_Y
    :type cl:float
    :initform 0.0)
   (CenterOfMass_Z
    :reader CenterOfMass_Z
    :initarg :CenterOfMass_Z
    :type cl:float
    :initform 0.0)
   (left_arm_out
    :reader left_arm_out
    :initarg :left_arm_out
    :type cl:fixnum
    :initform 0)
   (right_arm_out
    :reader right_arm_out
    :initarg :right_arm_out
    :type cl:fixnum
    :initform 0)
   (left_hand_raised
    :reader left_hand_raised
    :initarg :left_hand_raised
    :type cl:fixnum
    :initform 0)
   (right_hand_raised
    :reader right_hand_raised
    :initarg :right_hand_raised
    :type cl:fixnum
    :initform 0)
   (akimibo
    :reader akimibo
    :initarg :akimibo
    :type cl:fixnum
    :initform 0)
   (left_foot_up
    :reader left_foot_up
    :initarg :left_foot_up
    :type cl:fixnum
    :initform 0)
   (right_foot_up
    :reader right_foot_up
    :initarg :right_foot_up
    :type cl:fixnum
    :initform 0)
   (fall
    :reader fall
    :initarg :fall
    :type cl:fixnum
    :initform 0)
   (tips
    :reader tips
    :initarg :tips
    :type cl:fixnum
    :initform 0)
   (lock_status
    :reader lock_status
    :initarg :lock_status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass astra_sdk_bodyattitude (<astra_sdk_bodyattitude>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <astra_sdk_bodyattitude>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'astra_sdk_bodyattitude)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name skeleton_follow-msg:<astra_sdk_bodyattitude> is deprecated: use skeleton_follow-msg:astra_sdk_bodyattitude instead.")))

(cl:ensure-generic-function 'bodyid-val :lambda-list '(m))
(cl:defmethod bodyid-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:bodyid-val is deprecated.  Use skeleton_follow-msg:bodyid instead.")
  (bodyid m))

(cl:ensure-generic-function 'CenterOfMass_X-val :lambda-list '(m))
(cl:defmethod CenterOfMass_X-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:CenterOfMass_X-val is deprecated.  Use skeleton_follow-msg:CenterOfMass_X instead.")
  (CenterOfMass_X m))

(cl:ensure-generic-function 'CenterOfMass_Y-val :lambda-list '(m))
(cl:defmethod CenterOfMass_Y-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:CenterOfMass_Y-val is deprecated.  Use skeleton_follow-msg:CenterOfMass_Y instead.")
  (CenterOfMass_Y m))

(cl:ensure-generic-function 'CenterOfMass_Z-val :lambda-list '(m))
(cl:defmethod CenterOfMass_Z-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:CenterOfMass_Z-val is deprecated.  Use skeleton_follow-msg:CenterOfMass_Z instead.")
  (CenterOfMass_Z m))

(cl:ensure-generic-function 'left_arm_out-val :lambda-list '(m))
(cl:defmethod left_arm_out-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:left_arm_out-val is deprecated.  Use skeleton_follow-msg:left_arm_out instead.")
  (left_arm_out m))

(cl:ensure-generic-function 'right_arm_out-val :lambda-list '(m))
(cl:defmethod right_arm_out-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:right_arm_out-val is deprecated.  Use skeleton_follow-msg:right_arm_out instead.")
  (right_arm_out m))

(cl:ensure-generic-function 'left_hand_raised-val :lambda-list '(m))
(cl:defmethod left_hand_raised-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:left_hand_raised-val is deprecated.  Use skeleton_follow-msg:left_hand_raised instead.")
  (left_hand_raised m))

(cl:ensure-generic-function 'right_hand_raised-val :lambda-list '(m))
(cl:defmethod right_hand_raised-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:right_hand_raised-val is deprecated.  Use skeleton_follow-msg:right_hand_raised instead.")
  (right_hand_raised m))

(cl:ensure-generic-function 'akimibo-val :lambda-list '(m))
(cl:defmethod akimibo-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:akimibo-val is deprecated.  Use skeleton_follow-msg:akimibo instead.")
  (akimibo m))

(cl:ensure-generic-function 'left_foot_up-val :lambda-list '(m))
(cl:defmethod left_foot_up-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:left_foot_up-val is deprecated.  Use skeleton_follow-msg:left_foot_up instead.")
  (left_foot_up m))

(cl:ensure-generic-function 'right_foot_up-val :lambda-list '(m))
(cl:defmethod right_foot_up-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:right_foot_up-val is deprecated.  Use skeleton_follow-msg:right_foot_up instead.")
  (right_foot_up m))

(cl:ensure-generic-function 'fall-val :lambda-list '(m))
(cl:defmethod fall-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:fall-val is deprecated.  Use skeleton_follow-msg:fall instead.")
  (fall m))

(cl:ensure-generic-function 'tips-val :lambda-list '(m))
(cl:defmethod tips-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:tips-val is deprecated.  Use skeleton_follow-msg:tips instead.")
  (tips m))

(cl:ensure-generic-function 'lock_status-val :lambda-list '(m))
(cl:defmethod lock_status-val ((m <astra_sdk_bodyattitude>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader skeleton_follow-msg:lock_status-val is deprecated.  Use skeleton_follow-msg:lock_status instead.")
  (lock_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <astra_sdk_bodyattitude>) ostream)
  "Serializes a message object of type '<astra_sdk_bodyattitude>"
  (cl:let* ((signed (cl:slot-value msg 'bodyid)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CenterOfMass_X))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CenterOfMass_Y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'CenterOfMass_Z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'left_arm_out)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_arm_out)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left_hand_raised)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_hand_raised)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'akimibo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'left_foot_up)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'right_foot_up)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'fall)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'tips)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lock_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <astra_sdk_bodyattitude>) istream)
  "Deserializes a message object of type '<astra_sdk_bodyattitude>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bodyid) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CenterOfMass_X) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CenterOfMass_Y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'CenterOfMass_Z) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_arm_out) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_arm_out) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_hand_raised) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_hand_raised) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'akimibo) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_foot_up) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_foot_up) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'fall) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'tips) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lock_status) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<astra_sdk_bodyattitude>)))
  "Returns string type for a message object of type '<astra_sdk_bodyattitude>"
  "skeleton_follow/astra_sdk_bodyattitude")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'astra_sdk_bodyattitude)))
  "Returns string type for a message object of type 'astra_sdk_bodyattitude"
  "skeleton_follow/astra_sdk_bodyattitude")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<astra_sdk_bodyattitude>)))
  "Returns md5sum for a message object of type '<astra_sdk_bodyattitude>"
  "cb21bd82e96aab6d386d23fcd631b859")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'astra_sdk_bodyattitude)))
  "Returns md5sum for a message object of type 'astra_sdk_bodyattitude"
  "cb21bd82e96aab6d386d23fcd631b859")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<astra_sdk_bodyattitude>)))
  "Returns full string definition for message of type '<astra_sdk_bodyattitude>"
  (cl:format cl:nil "int16 bodyid~%float32 CenterOfMass_X~%float32 CenterOfMass_Y~%float32 CenterOfMass_Z~%int8 left_arm_out~%int8 right_arm_out~%int8 left_hand_raised~%int8 right_hand_raised~%int8 akimibo~%int8 left_foot_up~%int8 right_foot_up~%int8 fall~%int8 tips~%int8 lock_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'astra_sdk_bodyattitude)))
  "Returns full string definition for message of type 'astra_sdk_bodyattitude"
  (cl:format cl:nil "int16 bodyid~%float32 CenterOfMass_X~%float32 CenterOfMass_Y~%float32 CenterOfMass_Z~%int8 left_arm_out~%int8 right_arm_out~%int8 left_hand_raised~%int8 right_hand_raised~%int8 akimibo~%int8 left_foot_up~%int8 right_foot_up~%int8 fall~%int8 tips~%int8 lock_status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <astra_sdk_bodyattitude>))
  (cl:+ 0
     2
     4
     4
     4
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <astra_sdk_bodyattitude>))
  "Converts a ROS message object to a list"
  (cl:list 'astra_sdk_bodyattitude
    (cl:cons ':bodyid (bodyid msg))
    (cl:cons ':CenterOfMass_X (CenterOfMass_X msg))
    (cl:cons ':CenterOfMass_Y (CenterOfMass_Y msg))
    (cl:cons ':CenterOfMass_Z (CenterOfMass_Z msg))
    (cl:cons ':left_arm_out (left_arm_out msg))
    (cl:cons ':right_arm_out (right_arm_out msg))
    (cl:cons ':left_hand_raised (left_hand_raised msg))
    (cl:cons ':right_hand_raised (right_hand_raised msg))
    (cl:cons ':akimibo (akimibo msg))
    (cl:cons ':left_foot_up (left_foot_up msg))
    (cl:cons ':right_foot_up (right_foot_up msg))
    (cl:cons ':fall (fall msg))
    (cl:cons ':tips (tips msg))
    (cl:cons ':lock_status (lock_status msg))
))
