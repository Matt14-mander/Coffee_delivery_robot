// Auto-generated. Do not edit!

// (in-package tarkbot_driver_yolo.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ControlWay {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mask_x_left = null;
      this.mask_x_right = null;
      this.mask_y_top = null;
      this.mask_y_bot = null;
      this.center_target = null;
      this.vel_x = null;
      this.vel_y_P = null;
      this.vel_y_D = null;
      this.vel_z_P = null;
      this.vel_z_D = null;
      this.en = null;
    }
    else {
      if (initObj.hasOwnProperty('mask_x_left')) {
        this.mask_x_left = initObj.mask_x_left
      }
      else {
        this.mask_x_left = 0.0;
      }
      if (initObj.hasOwnProperty('mask_x_right')) {
        this.mask_x_right = initObj.mask_x_right
      }
      else {
        this.mask_x_right = 0.0;
      }
      if (initObj.hasOwnProperty('mask_y_top')) {
        this.mask_y_top = initObj.mask_y_top
      }
      else {
        this.mask_y_top = 0.0;
      }
      if (initObj.hasOwnProperty('mask_y_bot')) {
        this.mask_y_bot = initObj.mask_y_bot
      }
      else {
        this.mask_y_bot = 0.0;
      }
      if (initObj.hasOwnProperty('center_target')) {
        this.center_target = initObj.center_target
      }
      else {
        this.center_target = 0.0;
      }
      if (initObj.hasOwnProperty('vel_x')) {
        this.vel_x = initObj.vel_x
      }
      else {
        this.vel_x = 0.0;
      }
      if (initObj.hasOwnProperty('vel_y_P')) {
        this.vel_y_P = initObj.vel_y_P
      }
      else {
        this.vel_y_P = 0.0;
      }
      if (initObj.hasOwnProperty('vel_y_D')) {
        this.vel_y_D = initObj.vel_y_D
      }
      else {
        this.vel_y_D = 0.0;
      }
      if (initObj.hasOwnProperty('vel_z_P')) {
        this.vel_z_P = initObj.vel_z_P
      }
      else {
        this.vel_z_P = 0.0;
      }
      if (initObj.hasOwnProperty('vel_z_D')) {
        this.vel_z_D = initObj.vel_z_D
      }
      else {
        this.vel_z_D = 0.0;
      }
      if (initObj.hasOwnProperty('en')) {
        this.en = initObj.en
      }
      else {
        this.en = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlWay
    // Serialize message field [mask_x_left]
    bufferOffset = _serializer.float32(obj.mask_x_left, buffer, bufferOffset);
    // Serialize message field [mask_x_right]
    bufferOffset = _serializer.float32(obj.mask_x_right, buffer, bufferOffset);
    // Serialize message field [mask_y_top]
    bufferOffset = _serializer.float32(obj.mask_y_top, buffer, bufferOffset);
    // Serialize message field [mask_y_bot]
    bufferOffset = _serializer.float32(obj.mask_y_bot, buffer, bufferOffset);
    // Serialize message field [center_target]
    bufferOffset = _serializer.float32(obj.center_target, buffer, bufferOffset);
    // Serialize message field [vel_x]
    bufferOffset = _serializer.float32(obj.vel_x, buffer, bufferOffset);
    // Serialize message field [vel_y_P]
    bufferOffset = _serializer.float32(obj.vel_y_P, buffer, bufferOffset);
    // Serialize message field [vel_y_D]
    bufferOffset = _serializer.float32(obj.vel_y_D, buffer, bufferOffset);
    // Serialize message field [vel_z_P]
    bufferOffset = _serializer.float32(obj.vel_z_P, buffer, bufferOffset);
    // Serialize message field [vel_z_D]
    bufferOffset = _serializer.float32(obj.vel_z_D, buffer, bufferOffset);
    // Serialize message field [en]
    bufferOffset = _serializer.int8(obj.en, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlWay
    let len;
    let data = new ControlWay(null);
    // Deserialize message field [mask_x_left]
    data.mask_x_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mask_x_right]
    data.mask_x_right = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mask_y_top]
    data.mask_y_top = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mask_y_bot]
    data.mask_y_bot = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [center_target]
    data.center_target = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_x]
    data.vel_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_y_P]
    data.vel_y_P = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_y_D]
    data.vel_y_D = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_z_P]
    data.vel_z_P = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vel_z_D]
    data.vel_z_D = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [en]
    data.en = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 41;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tarkbot_driver_yolo/ControlWay';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8c848fda070f270966c6dcd98dd08d58';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 mask_x_left
    
    float32 mask_x_right
    
    float32 mask_y_top
    
    float32 mask_y_bot
    
    float32 center_target
    
    float32 vel_x
    
    float32 vel_y_P
    
    float32 vel_y_D
    
    float32 vel_z_P
    
    float32 vel_z_D
    
    int8 en
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlWay(null);
    if (msg.mask_x_left !== undefined) {
      resolved.mask_x_left = msg.mask_x_left;
    }
    else {
      resolved.mask_x_left = 0.0
    }

    if (msg.mask_x_right !== undefined) {
      resolved.mask_x_right = msg.mask_x_right;
    }
    else {
      resolved.mask_x_right = 0.0
    }

    if (msg.mask_y_top !== undefined) {
      resolved.mask_y_top = msg.mask_y_top;
    }
    else {
      resolved.mask_y_top = 0.0
    }

    if (msg.mask_y_bot !== undefined) {
      resolved.mask_y_bot = msg.mask_y_bot;
    }
    else {
      resolved.mask_y_bot = 0.0
    }

    if (msg.center_target !== undefined) {
      resolved.center_target = msg.center_target;
    }
    else {
      resolved.center_target = 0.0
    }

    if (msg.vel_x !== undefined) {
      resolved.vel_x = msg.vel_x;
    }
    else {
      resolved.vel_x = 0.0
    }

    if (msg.vel_y_P !== undefined) {
      resolved.vel_y_P = msg.vel_y_P;
    }
    else {
      resolved.vel_y_P = 0.0
    }

    if (msg.vel_y_D !== undefined) {
      resolved.vel_y_D = msg.vel_y_D;
    }
    else {
      resolved.vel_y_D = 0.0
    }

    if (msg.vel_z_P !== undefined) {
      resolved.vel_z_P = msg.vel_z_P;
    }
    else {
      resolved.vel_z_P = 0.0
    }

    if (msg.vel_z_D !== undefined) {
      resolved.vel_z_D = msg.vel_z_D;
    }
    else {
      resolved.vel_z_D = 0.0
    }

    if (msg.en !== undefined) {
      resolved.en = msg.en;
    }
    else {
      resolved.en = 0
    }

    return resolved;
    }
};

module.exports = ControlWay;
