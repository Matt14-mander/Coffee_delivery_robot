// Auto-generated. Do not edit!

// (in-package skeleton_follow.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let astra_sdk_body = require('./astra_sdk_body.js');

//-----------------------------------------------------------

class astra_sdk_bodynumber {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.count = null;
      this.bodies = null;
    }
    else {
      if (initObj.hasOwnProperty('count')) {
        this.count = initObj.count
      }
      else {
        this.count = 0;
      }
      if (initObj.hasOwnProperty('bodies')) {
        this.bodies = initObj.bodies
      }
      else {
        this.bodies = new Array(6).fill(new astra_sdk_body());
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type astra_sdk_bodynumber
    // Serialize message field [count]
    bufferOffset = _serializer.int8(obj.count, buffer, bufferOffset);
    // Check that the constant length array field [bodies] has the right length
    if (obj.bodies.length !== 6) {
      throw new Error('Unable to serialize array field bodies - length must be 6')
    }
    // Serialize message field [bodies]
    obj.bodies.forEach((val) => {
      bufferOffset = astra_sdk_body.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type astra_sdk_bodynumber
    let len;
    let data = new astra_sdk_bodynumber(null);
    // Deserialize message field [count]
    data.count = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [bodies]
    len = 6;
    data.bodies = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bodies[i] = astra_sdk_body.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    return 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'skeleton_follow/astra_sdk_bodynumber';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a1b1dea345dbea1f84926cdcaf9c5b80';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 count
    astra_sdk_body[6] bodies
    ================================================================================
    MSG: skeleton_follow/astra_sdk_body
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
    const resolved = new astra_sdk_bodynumber(null);
    if (msg.count !== undefined) {
      resolved.count = msg.count;
    }
    else {
      resolved.count = 0
    }

    if (msg.bodies !== undefined) {
      resolved.bodies = new Array(6)
      for (let i = 0; i < resolved.bodies.length; ++i) {
        if (msg.bodies.length > i) {
          resolved.bodies[i] = astra_sdk_body.Resolve(msg.bodies[i]);
        }
        else {
          resolved.bodies[i] = new astra_sdk_body();
        }
      }
    }
    else {
      resolved.bodies = new Array(6).fill(new astra_sdk_body())
    }

    return resolved;
    }
};

module.exports = astra_sdk_bodynumber;
