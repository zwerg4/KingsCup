const mongoose = require('mongoose');
const playerSchema = require('./player');

const roomSceema = new mongoose.Schema({
//    occupancy:{
//        type: Number,
//        default: 0,
//    },
    maxRounds:{
        type: Number,
        default: 40,
    },
    currentRoom:{
        required: true,
        type: Number,
        default: 1,
    },
    players:[playerSchema],
    isJoin:{
        type: Boolean,
        default:true,
    },
    turn:playerSchema,
    turnIndex: {
        type: Number,
        default: 0,
    }
    
});

const roomModel = mongoose.model('Room', roomSceema);
module.exports = roomModel;