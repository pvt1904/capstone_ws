// Auto-generated. Do not edit!

// (in-package path_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MoveToPositionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_positions = null;
      this.duration = null;
    }
    else {
      if (initObj.hasOwnProperty('target_positions')) {
        this.target_positions = initObj.target_positions
      }
      else {
        this.target_positions = [];
      }
      if (initObj.hasOwnProperty('duration')) {
        this.duration = initObj.duration
      }
      else {
        this.duration = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveToPositionRequest
    // Serialize message field [target_positions]
    bufferOffset = _arraySerializer.float64(obj.target_positions, buffer, bufferOffset, null);
    // Serialize message field [duration]
    bufferOffset = _serializer.float64(obj.duration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveToPositionRequest
    let len;
    let data = new MoveToPositionRequest(null);
    // Deserialize message field [target_positions]
    data.target_positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [duration]
    data.duration = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.target_positions.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_control/MoveToPositionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '30b4649adaa49810130ba13f74e336f8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] target_positions  # Desired joint positions
    float64 duration            # Time to reach the target positions
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveToPositionRequest(null);
    if (msg.target_positions !== undefined) {
      resolved.target_positions = msg.target_positions;
    }
    else {
      resolved.target_positions = []
    }

    if (msg.duration !== undefined) {
      resolved.duration = msg.duration;
    }
    else {
      resolved.duration = 0.0
    }

    return resolved;
    }
};

class MoveToPositionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveToPositionResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveToPositionResponse
    let len;
    let data = new MoveToPositionResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_control/MoveToPositionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success                # Whether the operation was successful
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveToPositionResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: MoveToPositionRequest,
  Response: MoveToPositionResponse,
  md5sum() { return 'ef814b4102028e360f0cb6df9fa221a9'; },
  datatype() { return 'path_control/MoveToPosition'; }
};
