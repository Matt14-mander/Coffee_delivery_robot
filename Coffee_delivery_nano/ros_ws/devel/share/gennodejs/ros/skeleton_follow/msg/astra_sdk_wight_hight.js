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

class astra_sdk_wight_hight {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.width_l = null;
      this.width_r = null;
      this.height_t = null;
      this.height_b = null;
    }
    else {
      if (initObj.hasOwnProperty('width_l')) {
        this.width_l = initObj.width_l
      }
      else {
        this.width_l = 0;
      }
      if (initObj.hasOwnProperty('width_r')) {
        this.width_r = initObj.width_r
      }
      else {
        this.width_r = 0;
      }
      if (initObj.hasOwnProperty('height_t')) {
        this.height_t = initObj.height_t
      }
      else {
        this.height_t = 0;
      }
      if (initObj.hasOwnProperty('height_b')) {
        this.height_b = initObj.height_b
      }
      else {
        this.height_b = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type astra_sdk_wight_hight
    // Serialize message field [width_l]
    bufferOffset = _serializer.int32(obj.width_l, buffer, bufferOffset);
    // Serialize message field [width_r]
    bufferOffset = _serializer.int32(obj.width_r, buffer, bufferOffset);
    // Serialize message field [height_t]
    bufferOffset = _serializer.int32(obj.height_t, buffer, bufferOffset);
    // Serialize message field [height_b]
    bufferOffset = _serializer.int32(obj.height_b, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type astra_sdk_wight_hight
    let len;
    let data = new astra_sdk_wight_hight(null);
    // Deserialize message field [width_l]
    data.width_l = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [width_r]
    data.width_r = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [height_t]
    data.height_t = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [height_b]
    data.height_b = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'skeleton_follow/astra_sdk_wight_hight';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4642cd8cf102c212293540c01a4443bd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 width_l
    int32 width_r
    int32 height_t
    int32 height_b
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new astra_sdk_wight_hight(null);
    if (msg.width_l !== undefined) {
      resolved.width_l = msg.width_l;
    }
    else {
      resolved.width_l = 0
    }

    if (msg.width_r !== undefined) {
      resolved.width_r = msg.width_r;
    }
    else {
      resolved.width_r = 0
    }

    if (msg.height_t !== undefined) {
      resolved.height_t = msg.height_t;
    }
    else {
      resolved.height_t = 0
    }

    if (msg.height_b !== undefined) {
      resolved.height_b = msg.height_b;
    }
    else {
      resolved.height_b = 0
    }

    return resolved;
    }
};

module.exports = astra_sdk_wight_hight;
