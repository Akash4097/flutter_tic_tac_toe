const express = require("express")
const http = require("http")
const mongoose = require("mongoose")


const app = express()
const port = process.env.port || 3000

var server = http.createServer(app)

var io = require("socket.io")(server)

app.use(express.json())

const DB = ""

mongoose.connect(DB)

server.listen(port, "0.0.0.0" ,() => {
  console.log(`Server started and running at port ${port}`)
})