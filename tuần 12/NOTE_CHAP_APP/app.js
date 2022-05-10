var mysql = require('mysql');
const express = require("express");
const app = express();
const connectUser = new Set();
const port = process.env.PORT || 5000;

const server = app.listen(port, ()=>{
    console.log("Server is Started on", port);
});
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database:"message"
});


const io = require("socket.io")(server);
var sql = "INSERT INTO micheline_skyl (id,message, sentByMe,sentByYou,messageType) VALUES ?";


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
    var message = data['message'];
    var sentByMe = data['sentByMe'];
    var sentByYou = data['sentByYou'];
    var messageType = data['messageType'];
    socket.broadcast.emit('message-receive',data);
    io.emit('connect-User',connectUser.size);
    var values = [1,message, sentByMe,sentByYou,messageType];
    // con.connect(function(err) {
    //   if (err) throw err;
    //   console.log("Connected!");
    //   con.query(sql, [values] ,(err, res)=>{

    //     if(err) throw err;
    //     console.log("Number of records inserted: " + res.affectedRows);
    //   });


    // });
    

  })
})

