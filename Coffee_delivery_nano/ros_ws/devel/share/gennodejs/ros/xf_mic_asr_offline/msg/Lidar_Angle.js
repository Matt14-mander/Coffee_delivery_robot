// Auto-generated. Do not edit!

// (in-package xf_mic_asr_offline.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Lidar_Angle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start_angle = null;
      this.end_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('start_angle')) {
        this.start_angle = initObj.start_angle
      }
      else {
        this.start_angle = 0;
      }
      if (initObj.hasOwnProperty('end_angle')) {
        this.end_angle = initObj.end_angle
      }
      else {
        this.end_angle = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Lidar_Angle
    // Serialize message field [start_angle]
    bufferOffset = _serializer.int16(obj.start_angle, buffer, bufferOffset);
    // Serialize message field [end_angle]
    bufferOffset = _serializer.int16(obj.end_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Lidar_Angle
    let len;
    let data = new Lidar_Angle(null);
    // Deserialize message field [start_angle]
    data.start_angle = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [end_angle]
    data.end_angle = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'xf_mic_asr_offline/Lidar_Angle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2684a80dd6dd0c664a3b5f39f5f7cc9e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 start_angle
    int16 end_angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Lidar_Angle(null);
    if (msg.start_angle !== undefined) {
      resolved.start_angle = msg.start_angle;
    }
    else {
      resolved.start_angle = 0
    }

    if (msg.end_angle !== undefined) {
      resolved.end_angle = msg.end_angle;
    }
    else {
      resolved.end_angle = 0
    }

    return resolved;
    }
};

module.exports = Lidar_Angle;
