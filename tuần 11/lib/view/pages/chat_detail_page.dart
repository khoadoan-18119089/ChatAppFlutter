import 'dart:async';
import 'dart:convert';

import 'package:chat_messanger_ui/controller/apiconstant.dart';
import 'package:chat_messanger_ui/controller/con_messange.dart';
import 'package:chat_messanger_ui/view/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:chat_messanger_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:http/http.dart' as http;

import '../../controller/chat_controller.dart';
import '../../model/mess_model.dart';
import '../../model/model_messenge.dart';
import 'package:mysql1/mysql1.dart';

class ChatDetailPage extends StatefulWidget {
  final String user, imguser;
  final bool online;
  const ChatDetailPage(
      {required this.user,
      required this.imguser,
      required this.online,
      Key? key})
      : super(key: key);
  @override
  _ChatDetailPageState createState() =>
      _ChatDetailPageState(user: user, imguser: imguser, online: online);
}

late IO.Socket socket;

ChatController chatController = ChatController();
late Future<Message> mess;

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _sendMessageController = TextEditingController();
  String user, imguser;
  bool online;
  _ChatDetailPageState(
      {required this.user, required this.imguser, required this.online});
  bool visible = false;
  Future webCall() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'message',
        password: ''));
    await conn.query('select * from customers where id = 10').then((a) => {
          for (var row in a) {print(row)}
        });
  }

  Future<List<Message>>? data1;
  List<Message> list = [];

  @override
  void initState() {
    super.initState();
    getdata();

    socket = IO.io(
        'http://192.168.2.65:5000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
    setUpSocket();
    socket.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey.withOpacity(0.2),
        elevation: 0,
        leading: FlatButton(
            onPressed: () {
              chatController.chatMess = <Message>[].obs;
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: primary,
            )),
        title: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(imguser), fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: black),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  online ? "online" : "offline",
                  style: TextStyle(color: black.withOpacity(0.4), fontSize: 14),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          const Icon(
            LineIcons.phone,
            color: primary,
            size: 32,
          ),
          const SizedBox(
            width: 15,
          ),
          const Icon(
            LineIcons.photoVideo,
            color: primary,
            size: 35,
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 13,
            height: 13,
            decoration: BoxDecoration(
                color: online ? xanh : grey,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white38)),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(color: grey.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              child: Row(
                children: const <Widget>[
                  Icon(
                    Icons.add_circle,
                    size: 35,
                    color: primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.camera_alt,
                    size: 35,
                    color: primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.photo,
                    size: 35,
                    color: primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.keyboard_voice,
                    size: 35,
                    color: primary,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width - 40) / 2,
              child: Row(
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 140) / 2,
                    height: 40,
                    decoration: BoxDecoration(
                        color: grey, borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: TextField(
                        cursorColor: black,
                        controller: _sendMessageController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Aa",
                            suffixIcon: GestureDetector(
                              child: const Icon(Icons.send),
                              onTap: () {
                                sendMess(_sendMessageController.text);
                                _sendMessageController.text = '';
                              },
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    Icons.thumb_up,
                    size: 35,
                    color: primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getdata() async {
    String Url = ApiConstant().baseUrl + ApiConstant().readData;
    var response = await http.get(Uri.parse(Url));
    var data = jsonDecode(response.body);
    for (Map<String, dynamic> mess in data) {
      var messageJson = {
        'id': mess['id'],
        'message': mess['message'],
        'sentByMe': mess['sentByMe']
      };
      print(messageJson);
      socket.emit('message', messageJson);
      chatController.chatMess.add(Message.fromJson(messageJson));
      // var d = {'message': mess['message']??'', 'senByMe': mess['senByMe']??''};
      // // readdata.add(Message(message: mess['message'], senByMe: mess['senByMe']));
      // chatController.chatMess.add(Message.fromJson(d));
    }
    //var id = data['id'];
    //var postHeader = data['post_header'];
    //var postBody = data['post_body'];
    //print(data.toString());
  }

  void setUpSocket() {
    socket.on('message-receive', (data) {
      //print(data);
      chatController.chatMess.add(Message.fromJson(data));
    });
    socket.on('connect-User', (data) {
      print(data);
      chatController.connectedUser.value = data;
    });
  }

  void sendMess(String text) {
    var messageJson = {
      'id': 1,
      'message': text,
      'sentByMe': user,
    };
    messageJson['id'] = 1;

    print(messageJson);
    socket.emit('message', messageJson);
    chatController.chatMess.add(Message.fromJson(messageJson));
  }

  Widget getBody() {
    return Obx(() => ListView.builder(
          itemCount: chatController.chatMess.length,
          itemBuilder: (context, index) {
            var d = chatController.chatMess[index];
            print(d.senByMe);
            return ChatBubble(
              isMe: d.senByMe,
              message: d.message,
              user: user,
              profileImg: imguser,
            );
          },
        ));
    // return Obx(() => ListView.builder(
    //     itemCount: chatController.chatMess.length,
    //     itemBuilder: (context, index) {
    //       var item = chatController.chatMess[index];
    //       return ChatBubble(
    //         isMe: item.senByMe,
    //         message: item.message,
    //       );
    //     }));
  }
}

class ChatBubble extends StatelessWidget {
  final String isMe;
  final String profileImg;
  final String message;
  final String messageType;
  final String user;
  const ChatBubble({
    Key? key,
    this.isMe = '',
    this.profileImg =
        'https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80',
    this.message = '',
    this.messageType = '2',
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe == user) {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          mainAxisAlignment:
              isMe == user ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: primary, borderRadius: getMessageType(messageType)),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: const TextStyle(color: white, fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(profileImg), fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: grey, borderRadius: getMessageType(messageType)),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: const TextStyle(color: black, fontSize: 17),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  getMessageType(messageType) {
    if (isMe == user) {
      // start message
      if (messageType == '1') {
        return const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // middle message
      else if (messageType == '2') {
        return const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // end message
      else if (messageType == '3') {
        return const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(30));
      }
      // standalone message
      else {
        return const BorderRadius.all(Radius.circular(30));
      }
    }
    // for sender bubble
    else {
      // start message
      if (messageType == '1') {
        return const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // middle message
      else if (messageType == '2') {
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // end message
      else if (messageType == '3') {
        return const BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30));
      }
      // standalone message
      else {
        return const BorderRadius.all(Radius.circular(30));
      }
    }
  }
}
