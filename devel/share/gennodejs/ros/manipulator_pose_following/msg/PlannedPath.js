// Auto-generated. Do not edit!

// (in-package manipulator_pose_following.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PlannedPath {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
      this.delta_time = null;
      this.calc_vel = null;
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
      if (initObj.hasOwnProperty('delta_time')) {
        this.delta_time = initObj.delta_time
      }
      else {
        this.delta_time = 0.0;
      }
      if (initObj.hasOwnProperty('calc_vel')) {
        this.calc_vel = initObj.calc_vel
      }
      else {
        this.calc_vel = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlannedPath
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.float64(obj.z, buffer, bufferOffset);
    // Serialize message field [delta_time]
    bufferOffset = _serializer.float32(obj.delta_time, buffer, bufferOffset);
    // Serialize message field [calc_vel]
    bufferOffset = _serializer.float32(obj.calc_vel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlannedPath
    let len;
    let data = new PlannedPath(null);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [delta_time]
    data.delta_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [calc_vel]
    data.calc_vel = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'manipulator_pose_following/PlannedPath';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80ec71fca2b6f56267998c14845654ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 x
    float64 y
    float64 z
    float32 delta_time
    float32 calc_vel
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlannedPath(null);
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

    if (msg.delta_time !== undefined) {
      resolved.delta_time = msg.delta_time;
    }
    else {
      resolved.delta_time = 0.0
    }

    if (msg.calc_vel !== undefined) {
      resolved.calc_vel = msg.calc_vel;
    }
    else {
      resolved.calc_vel = 0.0
    }

    return resolved;
    }
};

module.exports = PlannedPath;
