const mongoose = require('mongoose');

const playerSchema = new mongoose.Schema({
    nickname:{
        type: String,
        trim:true,
    },
    socketID:{
        type:String
    },
});

module.exports = playerSchema;