// Auto-generated. Do not edit!

// (in-package skeleton_follow.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let astra_sdk_vector2f = require('./astra_sdk_vector2f.js');
let astra_sdk_vector3f = require('./astra_sdk_vector3f.js');

//-----------------------------------------------------------

class astra_sdk_joint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.depthPosition = null;
      this.worldPosition = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('depthPosition')) {
        this.depthPosition = initObj.depthPosition
      }
      else {
        this.depthPosition = new astra_sdk_vector2f();
      }
      if (initObj.hasOwnProperty('worldPosition')) {
        this.worldPosition = initObj.worldPosition
      }
      else {
        this.worldPosition = new astra_sdk_vector3f();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type astra_sdk_joint
    // Serialize message field [type]
    bufferOffset = _serializer.int8(obj.type, buffer, bufferOffset);
    // Serialize message field [depthPosition]
    bufferOffset = astra_sdk_vector2f.serialize(obj.depthPosition, buffer, bufferOffset);
    // Serialize message field [worldPosition]
    bufferOffset = astra_sdk_vector3f.serialize(obj.worldPosition, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type astra_sdk_joint
    let len;
    let data = new astra_sdk_joint(null);
    // Deserialize message field [type]
    data.type = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [depthPosition]
    data.depthPosition = astra_sdk_vector2f.deserialize(buffer, bufferOffset);
    // Deserialize message field [worldPosition]
    data.worldPosition = astra_sdk_vector3f.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'skeleton_follow/astra_sdk_joint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e4de40bc4d9da2df315d3755d4261051';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 type
    astra_sdk_vector2f depthPosition
    astra_sdk_vector3f worldPosition
    ================================================================================
    MSG: skeleton_follow/astra_sdk_vector2f
    float32 x
    float32 y
    ================================================================================
    MSG: skeleton_follow/astra_sdk_vector3f
    float32 x
    float32 y
    float32 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new astra_sdk_joint(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.depthPosition !== undefined) {
      resolved.depthPosition = astra_sdk_vector2f.Resolve(msg.depthPosition)
    }
    else {
      resolved.depthPosition = new astra_sdk_vector2f()
    }

    if (msg.worldPosition !== undefined) {
      resolved.worldPosition = astra_sdk_vector3f.Resolve(msg.worldPosition)
    }
    else {
      resolved.worldPosition = new astra_sdk_vector3f()
    }

    return resolved;
    }
};

module.exports = astra_sdk_joint;
