const mongoose = require("mongoose")

const playerSchema = new mongoose.Schema({
    nickName: {
      type: String,
      trim: true,
    },
    socketID: {
      type: String,
    },
    points: {
      type: Number,
      default: 0,
    },
    charType: {
      required: true,
      type: String,
    },
  });

  module.exports = playerSchema