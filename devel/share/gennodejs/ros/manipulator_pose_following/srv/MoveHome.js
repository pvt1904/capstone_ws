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

class MoveHomeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_vel_fact = null;
      this.max_acc_fact = null;
    }
    else {
      if (initObj.hasOwnProperty('max_vel_fact')) {
        this.max_vel_fact = initObj.max_vel_fact
      }
      else {
        this.max_vel_fact = 0.0;
      }
      if (initObj.hasOwnProperty('max_acc_fact')) {
        this.max_acc_fact = initObj.max_acc_fact
      }
      else {
        this.max_acc_fact = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveHomeRequest
    // Serialize message field [max_vel_fact]
    bufferOffset = _serializer.float32(obj.max_vel_fact, buffer, bufferOffset);
    // Serialize message field [max_acc_fact]
    bufferOffset = _serializer.float32(obj.max_acc_fact, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveHomeRequest
    let len;
    let data = new MoveHomeRequest(null);
    // Deserialize message field [max_vel_fact]
    data.max_vel_fact = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_acc_fact]
    data.max_acc_fact = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulator_pose_following/MoveHomeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0e3dd77186dd39b45dd658ce66c915e2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 max_vel_fact
    float32 max_acc_fact
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveHomeRequest(null);
    if (msg.max_vel_fact !== undefined) {
      resolved.max_vel_fact = msg.max_vel_fact;
    }
    else {
      resolved.max_vel_fact = 0.0
    }

    if (msg.max_acc_fact !== undefined) {
      resolved.max_acc_fact = msg.max_acc_fact;
    }
    else {
      resolved.max_acc_fact = 0.0
    }

    return resolved;
    }
};

class MoveHomeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reply = null;
    }
    else {
      if (initObj.hasOwnProperty('reply')) {
        this.reply = initObj.reply
      }
      else {
        this.reply = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveHomeResponse
    // Serialize message field [reply]
    bufferOffset = _serializer.int32(obj.reply, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveHomeResponse
    let len;
    let data = new MoveHomeResponse(null);
    // Deserialize message field [reply]
    data.reply = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulator_pose_following/MoveHomeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a3d102284a2e84efb923807f61669857';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 reply
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveHomeResponse(null);
    if (msg.reply !== undefined) {
      resolved.reply = msg.reply;
    }
    else {
      resolved.reply = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: MoveHomeRequest,
  Response: MoveHomeResponse,
  md5sum() { return '2b1a8682c27b5174f22f80c985fc7be9'; },
  datatype() { return 'manipulator_pose_following/MoveHome'; }
};
