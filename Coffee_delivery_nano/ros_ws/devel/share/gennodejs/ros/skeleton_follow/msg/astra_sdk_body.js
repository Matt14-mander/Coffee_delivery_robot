// Auto-generated. Do not edit!

// (in-package skeleton_follow.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let astra_sdk_vector3f = require('./astra_sdk_vector3f.js');
let astra_sdk_joint = require('./astra_sdk_joint.js');

//-----------------------------------------------------------

class astra_sdk_body {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bodyid = null;
      this.centerOfMass = null;
      this.joints = null;
    }
    else {
      if (initObj.hasOwnProperty('bodyid')) {
        this.bodyid = initObj.bodyid
      }
      else {
        this.bodyid = 0;
      }
      if (initObj.hasOwnProperty('centerOfMass')) {
        this.centerOfMass = initObj.centerOfMass
      }
      else {
        this.centerOfMass = new astra_sdk_vector3f();
      }
      if (initObj.hasOwnProperty('joints')) {
        this.joints = initObj.joints
      }
      else {
        this.joints = new Array(19).fill(new astra_sdk_joint());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type astra_sdk_body
    // Serialize message field [bodyid]
    bufferOffset = _serializer.int16(obj.bodyid, buffer, bufferOffset);
    // Serialize message field [centerOfMass]
    bufferOffset = astra_sdk_vector3f.serialize(obj.centerOfMass, buffer, bufferOffset);
    // Check that the constant length array field [joints] has the right length
    if (obj.joints.length !== 19) {
      throw new Error('Unable to serialize array field joints - length must be 19')
    }
    // Serialize message field [joints]
    obj.joints.forEach((val) => {
      bufferOffset = astra_sdk_joint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type astra_sdk_body
    let len;
    let data = new astra_sdk_body(null);
    // Deserialize message field [bodyid]
    data.bodyid = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [centerOfMass]
    data.centerOfMass = astra_sdk_vector3f.deserialize(buffer, bufferOffset);
    // Deserialize message field [joints]
    len = 19;
    data.joints = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.joints[i] = astra_sdk_joint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    return 35;
  }

  static datatype() {
    // Returns string type for a message object
    return 'skeleton_follow/astra_sdk_body';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '57f2da357721aaca7548e8de3d97f76a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 bodyid
    astra_sdk_vector3f centerOfMass
    astra_sdk_joint[19] joints
    ================================================================================
    MSG: skeleton_follow/astra_sdk_vector3f
    float32 x
    float32 y
    float32 z
    ================================================================================
    MSG: skeleton_follow/astra_sdk_joint
    int8 type
    astra_sdk_vector2f depthPosition
    astra_sdk_vector3f worldPosition
    ================================================================================
    MSG: skeleton_follow/astra_sdk_vector2f
    float32 x
    float32 y
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new astra_sdk_body(null);
    if (msg.bodyid !== undefined) {
      resolved.bodyid = msg.bodyid;
    }
    else {
      resolved.bodyid = 0
    }

    if (msg.centerOfMass !== undefined) {
      resolved.centerOfMass = astra_sdk_vector3f.Resolve(msg.centerOfMass)
    }
    else {
      resolved.centerOfMass = new astra_sdk_vector3f()
    }

    if (msg.joints !== undefined) {
      resolved.joints = new Array(19)
      for (let i = 0; i < resolved.joints.length; ++i) {
        if (msg.joints.length > i) {
          resolved.joints[i] = astra_sdk_joint.Resolve(msg.joints[i]);
        }
        else {
          resolved.joints[i] = new astra_sdk_joint();
        }
      }
    }
    else {
      resolved.joints = new Array(19).fill(new astra_sdk_joint())
    }

    return resolved;
    }
};

module.exports = astra_sdk_body;
