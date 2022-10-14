const mongoose = require('mongoose');
const playerSchema = require('./player');

const roomSceema = new mongoose.Schema({
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
    },
    roundReady:{
        type: Boolean,
        default:true,
    },
    cards:{
        type:[String],
        default:[],
    },
    nextCard:{
        type:String,
        default:'',
    },

});

const roomModel = mongoose.model('Room', roomSceema);
module.exports = roomModel;