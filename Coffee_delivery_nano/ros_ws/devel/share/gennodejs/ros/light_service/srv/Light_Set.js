// Auto-generated. Do not edit!

// (in-package light_service.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class Light_SetRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.RGB_M_ = null;
      this.RGB_S_ = null;
      this.RGB_T_ = null;
      this.RGB_R_ = null;
      this.RGB_G_ = null;
      this.RGB_B_ = null;
    }
    else {
      if (initObj.hasOwnProperty('RGB_M_')) {
        this.RGB_M_ = initObj.RGB_M_
      }
      else {
        this.RGB_M_ = 0;
      }
      if (initObj.hasOwnProperty('RGB_S_')) {
        this.RGB_S_ = initObj.RGB_S_
      }
      else {
        this.RGB_S_ = 0;
      }
      if (initObj.hasOwnProperty('RGB_T_')) {
        this.RGB_T_ = initObj.RGB_T_
      }
      else {
        this.RGB_T_ = 0;
      }
      if (initObj.hasOwnProperty('RGB_R_')) {
        this.RGB_R_ = initObj.RGB_R_
      }
      else {
        this.RGB_R_ = 0;
      }
      if (initObj.hasOwnProperty('RGB_G_')) {
        this.RGB_G_ = initObj.RGB_G_
      }
      else {
        this.RGB_G_ = 0;
      }
      if (initObj.hasOwnProperty('RGB_B_')) {
        this.RGB_B_ = initObj.RGB_B_
      }
      else {
        this.RGB_B_ = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Light_SetRequest
    // Serialize message field [RGB_M_]
    bufferOffset = _serializer.int8(obj.RGB_M_, buffer, bufferOffset);
    // Serialize message field [RGB_S_]
    bufferOffset = _serializer.int8(obj.RGB_S_, buffer, bufferOffset);
    // Serialize message field [RGB_T_]
    bufferOffset = _serializer.uint8(obj.RGB_T_, buffer, bufferOffset);
    // Serialize message field [RGB_R_]
    bufferOffset = _serializer.uint8(obj.RGB_R_, buffer, bufferOffset);
    // Serialize message field [RGB_G_]
    bufferOffset = _serializer.uint8(obj.RGB_G_, buffer, bufferOffset);
    // Serialize message field [RGB_B_]
    bufferOffset = _serializer.uint8(obj.RGB_B_, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Light_SetRequest
    let len;
    let data = new Light_SetRequest(null);
    // Deserialize message field [RGB_M_]
    data.RGB_M_ = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [RGB_S_]
    data.RGB_S_ = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [RGB_T_]
    data.RGB_T_ = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RGB_R_]
    data.RGB_R_ = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RGB_G_]
    data.RGB_G_ = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [RGB_B_]
    data.RGB_B_ = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'light_service/Light_SetRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4d6e56e47207f4868318d90325077bb5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 客户端请求时发送的两个数字
    int8 RGB_M_
    int8 RGB_S_
    uint8 RGB_T_
    uint8 RGB_R_
    uint8 RGB_G_
    uint8 RGB_B_
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Light_SetRequest(null);
    if (msg.RGB_M_ !== undefined) {
      resolved.RGB_M_ = msg.RGB_M_;
    }
    else {
      resolved.RGB_M_ = 0
    }

    if (msg.RGB_S_ !== undefined) {
      resolved.RGB_S_ = msg.RGB_S_;
    }
    else {
      resolved.RGB_S_ = 0
    }

    if (msg.RGB_T_ !== undefined) {
      resolved.RGB_T_ = msg.RGB_T_;
    }
    else {
      resolved.RGB_T_ = 0
    }

    if (msg.RGB_R_ !== undefined) {
      resolved.RGB_R_ = msg.RGB_R_;
    }
    else {
      resolved.RGB_R_ = 0
    }

    if (msg.RGB_G_ !== undefined) {
      resolved.RGB_G_ = msg.RGB_G_;
    }
    else {
      resolved.RGB_G_ = 0
    }

    if (msg.RGB_B_ !== undefined) {
      resolved.RGB_B_ = msg.RGB_B_;
    }
    else {
      resolved.RGB_B_ = 0
    }

    return resolved;
    }
};

class Light_SetResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Light_SetResponse
    // Serialize message field [result]
    bufferOffset = _serializer.string(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Light_SetResponse
    let len;
    let data = new Light_SetResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.result.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'light_service/Light_SetResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c22f2a1ed8654a0b365f1bb3f7ff2c0f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # 服务器响应发送的数据
    string result
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Light_SetResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: Light_SetRequest,
  Response: Light_SetResponse,
  md5sum() { return 'cfc723b899523d9fb55d7d41b0cedf61'; },
  datatype() { return 'light_service/Light_Set'; }
};
