const express = require("express")
const http = require("http")
const mongoose = require("mongoose")
const dotenv = require("dotenv")

dotenv.config()

const app = express()
const port = process.env.port || 3000

var server = http.createServer(app)

var io = require("socket.io")(server)

app.use(express.json())
const DB = `mongodb+srv://${process.env.MONGODB_CLUSTER_USERNAME}:${process.env.MONGODB_CLUSTER_PWD}@dev.eme9vyp.mongodb.net/?retryWrites=true&w=majority&appName=dev`

mongoose.connect(DB).then(() => {
  console.log("MongooseDB Connection Successfull!")
}).catch((err) => {
  console.log(`Erro happened on mogoDB connection: ${err}`)
})

server.listen(port, "0.0.0.0", () => {
  console.log(`Server started and running at port ${port}`)
})