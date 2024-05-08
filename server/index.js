// import statement
const express = require("express")
const http = require("http")
const mongoose = require("mongoose")
const dotenv = require("dotenv").config()
const Room = require("./models/room.js")

// libs initial init...
const app = express()
const port = process.env.port || 3000

var server = http.createServer(app)
var io = require("socket.io")(server)

app.use(express.json())

// socket IO connection
io.on("connection", (socket) => {
  console.log("SocketIO: connected!");

  // CreateRoom Listeners
  socket.on("createRoom", async ({ nickname }) => {
    try {
      let room = new Room()

      let player = {
        socketID: socket.id,
        nickName: nickname,
        charType: 'X',
      }
      room.players.push(player)
      room.turn = player

      console.log(`room: ${room}`)

      room = await room.save()
      const roomId = room._id.toString()

      socket.join(roomId)

      io.to(roomId).emit("createRoomSuccess", room)
    } catch (error) {
      console.log(`Error happen on createRoom(Server): ${error}`)
    }
  })


  // JoinRoom Listeners
  socket.on("joinRoom", async ({ nickname, roomId }) => {
    try {
      if (!mongoose.isValidObjectId(roomId)) {
        socket.emit("errorOccurred", "Please enter valid roomId")
        return;
      }

      let room = await Room.findById(roomId)

      if (room.isJoin) {
        let player = {
          socketID: socket.id,
          nickName: nickname,
          charType: 'O',
        }
        socket.join(roomId)
        room.players.push(player)
        room.isJoin = false

        room = await room.save()

        io.to(roomId).emit("joinRoomSuccess", room)
        io.to(roomId).emit("updatePlayers", room.players)
      } else {
        socket.emit("errorOccurred", "Game is in progress, please try again later!")
      }
    } catch (error) {
      console.log(`Error happen on joinRoom(Server): ${error}`)
    }
  })
})


// mongoDB connection and initialization
const DB = `mongodb+srv://${process.env.MONGODB_CLUSTER_USERNAME}:${process.env.MONGODB_CLUSTER_PWD}@dev.eme9vyp.mongodb.net/?retryWrites=true&w=majority&appName=dev`
mongoose.connect(DB).then(() => {
  console.log("MongooseDB Connection Successfull!")
}).catch((err) => {
  console.log(`Erro happened on mogoDB connection: ${err}`)
})


server.listen(port, "0.0.0.0", () => {
  console.log(`Server started and running at port ${port}`)
})