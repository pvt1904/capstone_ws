// Auto-generated. Do not edit!

// (in-package manipulator_pose_following.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class InitPointRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.transfer_state = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0.0;
      }
      if (initObj.hasOwnProperty('transfer_state')) {
        this.transfer_state = initObj.transfer_state
      }
      else {
        this.transfer_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InitPointRequest
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [transfer_state]
    bufferOffset = _serializer.uint8(obj.transfer_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InitPointRequest
    let len;
    let data = new InitPointRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [transfer_state]
    data.transfer_state = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulator_pose_following/InitPointRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4fb5dff2be17969aff4b1898517fc2bf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #request fields
    float64 x
    float64 y
    float64 z
    uint8 transfer_state
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InitPointRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0.0
    }

    if (msg.transfer_state !== undefined) {
      resolved.transfer_state = msg.transfer_state;
    }
    else {
      resolved.transfer_state = 0
    }

    return resolved;
    }
};

class InitPointResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.transfer_state = null;
    }
    else {
      if (initObj.hasOwnProperty('transfer_state')) {
        this.transfer_state = initObj.transfer_state
      }
      else {
        this.transfer_state = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type InitPointResponse
    // Serialize message field [transfer_state]
    bufferOffset = _serializer.uint8(obj.transfer_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type InitPointResponse
    let len;
    let data = new InitPointResponse(null);
    // Deserialize message field [transfer_state]
    data.transfer_state = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulator_pose_following/InitPointResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd7441fb16c8bfa712d0c5cc7be6c7882';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 transfer_state
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new InitPointResponse(null);
    if (msg.transfer_state !== undefined) {
      resolved.transfer_state = msg.transfer_state;
    }
    else {
      resolved.transfer_state = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: InitPointRequest,
  Response: InitPointResponse,
  md5sum() { return '8cbed0c946766354de767198b507d0e3'; },
  datatype() { return 'manipulator_pose_following/InitPoint'; }
};
