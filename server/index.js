//includes
require('dotenv').config();
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const PlayerSchema = require('./models/player');


const app = express();
const port = process.env.PORT | 3000;
var server = http.createServer(app);
const Room = require('./models/room');

var io = require("socket.io")(server);

//middle ware
app.use(express.json());


const DB = "mongodb+srv://"+process.env.mongoAPI;


io.on("connection", (socket) => {
    console.log("socket.io connected");
    socket.on('createRoom', async ({ nickname, cards,nextCard }) => {
        console.log(nickname + " created a Room");
        console.log("SocketID: " + socket.id);

        try {
            //room creation
            let room = new Room();

            //player creation
            let player = {  
                socketID: socket.id,
                nickname: nickname, 
            }

            //add player to room and its his turn
            room.players.push(player);
            room.turn = player;

            room.cards = cards;
            room.nextCard = nextCard;
            console.log("nextCard: " + room.roundReady);
            

            room = await room.save();
            console.log(room);

            const roomID = room._id.toString();
            socket.join(roomID);

            io.to(roomID).emit("createRoomSuccess", room); 
            socket.emit("updatePlayer", [player, true]); 

        } catch(e){
            console.log(e);
        }
    });

    socket.on('joinRoom', async ({nickname, roomID}) => {
        try {
            if(!roomID.match(/^[0-9a-fA-F]{24}$/)){
                socket.emit('errorOccured','Please enter a valid room ID! ')
                return;
            }

            let room = await Room.findById(roomID);

            if(room.isJoin){
                let player = {
                    nickname : nickname,
                    socketID : socket.id,
                }
                socket.join(roomID);
                room.players.push(player);
                room = await room.save();

                io.to(roomID).emit("joinRoomSuccess", room); 
                socket.emit("updatePlayer", [player, false]); 
            } else {
                socket.emit('errorOccured','The game is already in progress, try an other one!');
            }

        } catch(e){
            console.log(e);
        }
    });

    socket.on('startGame', async ({roomID}) => {
        try {
            if(!roomID.match(/^[0-9a-fA-F]{24}$/)){
                socket.emit('errorOccured','Error finding the Room')
                return;
            }

            let room = await Room.findById(roomID);

            if(room.isJoin){
                socket.join(roomID);
                room.isJoin = false;
                room = await room.save();

                io.to(roomID).emit("startGame",room);  
            } else {
                socket.emit('errorOccured','The game is already in progress, try an other one!');
            }
        } catch(e){
            console.log(e);
        }
    });

    socket.on('cardFlipped', async ({roomID, nextCard, cards}) => {
        try {
            if(!roomID.match(/^[0-9a-fA-F]{24}$/)){
                socket.emit('errorOccured','Error finding the Room')
                return;
            }

            let room = await Room.findById(roomID);

                socket.join(roomID);
                room.roundReady = false;
                room.nextCard = nextCard;
                room.cards = cards;
                room = await room.save();

                io.to(roomID).emit("cardFlipped",room);  
        } catch(e){
            console.log(e);
        }
    });
});


mongoose.connect(DB).then(() => {
    console.log("Database connection successfull"); 
}).catch((e) => {
    console.log("Database connection failed: " + e); 
})

server.listen(port, '0.0.0.0', () =>{
    console.log("Server is starting and running on port: " + port);
});

console.log("========================================================");
console.log("                  NODE JS SERVER STARTED                ");
console.log("========================================================");