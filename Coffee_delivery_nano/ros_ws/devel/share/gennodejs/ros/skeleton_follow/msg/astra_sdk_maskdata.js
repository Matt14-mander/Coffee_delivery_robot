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

class astra_sdk_maskdata {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new Array(76800).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type astra_sdk_maskdata
    // Check that the constant length array field [data] has the right length
    if (obj.data.length !== 76800) {
      throw new Error('Unable to serialize array field data - length must be 76800')
    }
    // Serialize message field [data]
    bufferOffset = _arraySerializer.int32(obj.data, buffer, bufferOffset, 76800);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type astra_sdk_maskdata
    let len;
    let data = new astra_sdk_maskdata(null);
    // Deserialize message field [data]
    data.data = _arrayDeserializer.int32(buffer, bufferOffset, 76800)
    return data;
  }

  static getMessageSize(object) {
    return 307200;
  }

  static datatype() {
    // Returns string type for a message object
    return 'skeleton_follow/astra_sdk_maskdata';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '83e374be3f0eff604357f0d088c7c236';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[76800] data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new astra_sdk_maskdata(null);
    if (msg.data !== undefined) {
      resolved.data = msg.data;
    }
    else {
      resolved.data = new Array(76800).fill(0)
    }

    return resolved;
    }
};

module.exports = astra_sdk_maskdata;
