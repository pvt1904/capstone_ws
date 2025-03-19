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

class MoveToRPYRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose_rpy = null;
      this.max_vel_fact = null;
      this.max_acc_fact = null;
    }
    else {
      if (initObj.hasOwnProperty('pose_rpy')) {
        this.pose_rpy = initObj.pose_rpy
      }
      else {
        this.pose_rpy = [];
      }
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
    // Serializes a message object of type MoveToRPYRequest
    // Serialize message field [pose_rpy]
    bufferOffset = _arraySerializer.float32(obj.pose_rpy, buffer, bufferOffset, null);
    // Serialize message field [max_vel_fact]
    bufferOffset = _serializer.float32(obj.max_vel_fact, buffer, bufferOffset);
    // Serialize message field [max_acc_fact]
    bufferOffset = _serializer.float32(obj.max_acc_fact, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveToRPYRequest
    let len;
    let data = new MoveToRPYRequest(null);
    // Deserialize message field [pose_rpy]
    data.pose_rpy = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [max_vel_fact]
    data.max_vel_fact = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_acc_fact]
    data.max_acc_fact = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.pose_rpy.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulator_pose_following/MoveToRPYRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f636de656604161ed176afacc17ebd31';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] pose_rpy
    float32   max_vel_fact
    float32   max_acc_fact
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveToRPYRequest(null);
    if (msg.pose_rpy !== undefined) {
      resolved.pose_rpy = msg.pose_rpy;
    }
    else {
      resolved.pose_rpy = []
    }

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

class MoveToRPYResponse {
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
    // Serializes a message object of type MoveToRPYResponse
    // Serialize message field [reply]
    bufferOffset = _serializer.int32(obj.reply, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveToRPYResponse
    let len;
    let data = new MoveToRPYResponse(null);
    // Deserialize message field [reply]
    data.reply = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulator_pose_following/MoveToRPYResponse';
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
    const resolved = new MoveToRPYResponse(null);
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
  Request: MoveToRPYRequest,
  Response: MoveToRPYResponse,
  md5sum() { return 'a228832e898673e8095d7a0ddc0283a1'; },
  datatype() { return 'manipulator_pose_following/MoveToRPY'; }
};
