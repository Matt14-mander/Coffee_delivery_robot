// Auto-generated. Do not edit!

// (in-package skeleton_follow.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class astra_sdk_bodyattitude {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bodyid = null;
      this.CenterOfMass_X = null;
      this.CenterOfMass_Y = null;
      this.CenterOfMass_Z = null;
      this.left_arm_out = null;
      this.right_arm_out = null;
      this.left_hand_raised = null;
      this.right_hand_raised = null;
      this.akimibo = null;
      this.left_foot_up = null;
      this.right_foot_up = null;
      this.fall = null;
      this.tips = null;
      this.lock_status = null;
    }
    else {
      if (initObj.hasOwnProperty('bodyid')) {
        this.bodyid = initObj.bodyid
      }
      else {
        this.bodyid = 0;
      }
      if (initObj.hasOwnProperty('CenterOfMass_X')) {
        this.CenterOfMass_X = initObj.CenterOfMass_X
      }
      else {
        this.CenterOfMass_X = 0.0;
      }
      if (initObj.hasOwnProperty('CenterOfMass_Y')) {
        this.CenterOfMass_Y = initObj.CenterOfMass_Y
      }
      else {
        this.CenterOfMass_Y = 0.0;
      }
      if (initObj.hasOwnProperty('CenterOfMass_Z')) {
        this.CenterOfMass_Z = initObj.CenterOfMass_Z
      }
      else {
        this.CenterOfMass_Z = 0.0;
      }
      if (initObj.hasOwnProperty('left_arm_out')) {
        this.left_arm_out = initObj.left_arm_out
      }
      else {
        this.left_arm_out = 0;
      }
      if (initObj.hasOwnProperty('right_arm_out')) {
        this.right_arm_out = initObj.right_arm_out
      }
      else {
        this.right_arm_out = 0;
      }
      if (initObj.hasOwnProperty('left_hand_raised')) {
        this.left_hand_raised = initObj.left_hand_raised
      }
      else {
        this.left_hand_raised = 0;
      }
      if (initObj.hasOwnProperty('right_hand_raised')) {
        this.right_hand_raised = initObj.right_hand_raised
      }
      else {
        this.right_hand_raised = 0;
      }
      if (initObj.hasOwnProperty('akimibo')) {
        this.akimibo = initObj.akimibo
      }
      else {
        this.akimibo = 0;
      }
      if (initObj.hasOwnProperty('left_foot_up')) {
        this.left_foot_up = initObj.left_foot_up
      }
      else {
        this.left_foot_up = 0;
      }
      if (initObj.hasOwnProperty('right_foot_up')) {
        this.right_foot_up = initObj.right_foot_up
      }
      else {
        this.right_foot_up = 0;
      }
      if (initObj.hasOwnProperty('fall')) {
        this.fall = initObj.fall
      }
      else {
        this.fall = 0;
      }
      if (initObj.hasOwnProperty('tips')) {
        this.tips = initObj.tips
      }
      else {
        this.tips = 0;
      }
      if (initObj.hasOwnProperty('lock_status')) {
        this.lock_status = initObj.lock_status
      }
      else {
        this.lock_status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type astra_sdk_bodyattitude
    // Serialize message field [bodyid]
    bufferOffset = _serializer.int16(obj.bodyid, buffer, bufferOffset);
    // Serialize message field [CenterOfMass_X]
    bufferOffset = _serializer.float32(obj.CenterOfMass_X, buffer, bufferOffset);
    // Serialize message field [CenterOfMass_Y]
    bufferOffset = _serializer.float32(obj.CenterOfMass_Y, buffer, bufferOffset);
    // Serialize message field [CenterOfMass_Z]
    bufferOffset = _serializer.float32(obj.CenterOfMass_Z, buffer, bufferOffset);
    // Serialize message field [left_arm_out]
    bufferOffset = _serializer.int8(obj.left_arm_out, buffer, bufferOffset);
    // Serialize message field [right_arm_out]
    bufferOffset = _serializer.int8(obj.right_arm_out, buffer, bufferOffset);
    // Serialize message field [left_hand_raised]
    bufferOffset = _serializer.int8(obj.left_hand_raised, buffer, bufferOffset);
    // Serialize message field [right_hand_raised]
    bufferOffset = _serializer.int8(obj.right_hand_raised, buffer, bufferOffset);
    // Serialize message field [akimibo]
    bufferOffset = _serializer.int8(obj.akimibo, buffer, bufferOffset);
    // Serialize message field [left_foot_up]
    bufferOffset = _serializer.int8(obj.left_foot_up, buffer, bufferOffset);
    // Serialize message field [right_foot_up]
    bufferOffset = _serializer.int8(obj.right_foot_up, buffer, bufferOffset);
    // Serialize message field [fall]
    bufferOffset = _serializer.int8(obj.fall, buffer, bufferOffset);
    // Serialize message field [tips]
    bufferOffset = _serializer.int8(obj.tips, buffer, bufferOffset);
    // Serialize message field [lock_status]
    bufferOffset = _serializer.int8(obj.lock_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type astra_sdk_bodyattitude
    let len;
    let data = new astra_sdk_bodyattitude(null);
    // Deserialize message field [bodyid]
    data.bodyid = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [CenterOfMass_X]
    data.CenterOfMass_X = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [CenterOfMass_Y]
    data.CenterOfMass_Y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [CenterOfMass_Z]
    data.CenterOfMass_Z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [left_arm_out]
    data.left_arm_out = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [right_arm_out]
    data.right_arm_out = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [left_hand_raised]
    data.left_hand_raised = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [right_hand_raised]
    data.right_hand_raised = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [akimibo]
    data.akimibo = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [left_foot_up]
    data.left_foot_up = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [right_foot_up]
    data.right_foot_up = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [fall]
    data.fall = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [tips]
    data.tips = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [lock_status]
    data.lock_status = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'skeleton_follow/astra_sdk_bodyattitude';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cb21bd82e96aab6d386d23fcd631b859';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 bodyid
    float32 CenterOfMass_X
    float32 CenterOfMass_Y
    float32 CenterOfMass_Z
    int8 left_arm_out
    int8 right_arm_out
    int8 left_hand_raised
    int8 right_hand_raised
    int8 akimibo
    int8 left_foot_up
    int8 right_foot_up
    int8 fall
    int8 tips
    int8 lock_status
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new astra_sdk_bodyattitude(null);
    if (msg.bodyid !== undefined) {
      resolved.bodyid = msg.bodyid;
    }
    else {
      resolved.bodyid = 0
    }

    if (msg.CenterOfMass_X !== undefined) {
      resolved.CenterOfMass_X = msg.CenterOfMass_X;
    }
    else {
      resolved.CenterOfMass_X = 0.0
    }

    if (msg.CenterOfMass_Y !== undefined) {
      resolved.CenterOfMass_Y = msg.CenterOfMass_Y;
    }
    else {
      resolved.CenterOfMass_Y = 0.0
    }

    if (msg.CenterOfMass_Z !== undefined) {
      resolved.CenterOfMass_Z = msg.CenterOfMass_Z;
    }
    else {
      resolved.CenterOfMass_Z = 0.0
    }

    if (msg.left_arm_out !== undefined) {
      resolved.left_arm_out = msg.left_arm_out;
    }
    else {
      resolved.left_arm_out = 0
    }

    if (msg.right_arm_out !== undefined) {
      resolved.right_arm_out = msg.right_arm_out;
    }
    else {
      resolved.right_arm_out = 0
    }

    if (msg.left_hand_raised !== undefined) {
      resolved.left_hand_raised = msg.left_hand_raised;
    }
    else {
      resolved.left_hand_raised = 0
    }

    if (msg.right_hand_raised !== undefined) {
      resolved.right_hand_raised = msg.right_hand_raised;
    }
    else {
      resolved.right_hand_raised = 0
    }

    if (msg.akimibo !== undefined) {
      resolved.akimibo = msg.akimibo;
    }
    else {
      resolved.akimibo = 0
    }

    if (msg.left_foot_up !== undefined) {
      resolved.left_foot_up = msg.left_foot_up;
    }
    else {
      resolved.left_foot_up = 0
    }

    if (msg.right_foot_up !== undefined) {
      resolved.right_foot_up = msg.right_foot_up;
    }
    else {
      resolved.right_foot_up = 0
    }

    if (msg.fall !== undefined) {
      resolved.fall = msg.fall;
    }
    else {
      resolved.fall = 0
    }

    if (msg.tips !== undefined) {
      resolved.tips = msg.tips;
    }
    else {
      resolved.tips = 0
    }

    if (msg.lock_status !== undefined) {
      resolved.lock_status = msg.lock_status;
    }
    else {
      resolved.lock_status = 0
    }

    return resolved;
    }
};

module.exports = astra_sdk_bodyattitude;
