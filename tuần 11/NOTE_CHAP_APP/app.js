

const express = require("express");
const app = express();
const connectUser = new Set();
const port = process.env.PORT || 5000;

const server = app.listen(port, ()=>{
    console.log("Server is Started on", port);
});


const io = require("socket.io")(server);

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "message"
});
io.on("connection", (socket)=>{
  console.log("conneted", socket.id);
  connectUser.add(socket.id);
  io.emit('connect-User',connectUser.size);
  socket.on('disconected', ()=>{
    onsole.log("disconected", socket.id);
    connectUser.delete(socket.id);
  });
  socket.on("message", (data)=>{
    console.log(data);
    socket.broadcast.emit('message-receive',data);
    io.emit('connect-User',connectUser.size);
    

  })
})

