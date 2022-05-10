import 'dart:convert';

import 'package:chat_messanger_ui/model/mess_model.dart';

import '../controller/apiconstant.dart';
import 'package:http/http.dart' as http;
import 'package:chat_messanger_ui/constant/constant.dart';

Future getdata() async {
  var Url =
      ApiConstant().baseUrl + ApiConstant().server + ApiConstant().readData;
  var response = await http.get(Uri.parse(Url));
  var data = jsonDecode(response.body);
  for (Map<String, dynamic> mess in data) {
    var messageJson = {
      'id': mess['id'],
      'message': mess['message'],
      'sentByMe': mess['sentByMe'],
      'sentByYou': mess['sentByYou'],
      'messageType': mess["messageType"]
    };
    socket.emit(
      'message',
      messageJson,
    );
    chatController.chatMess.add(Message.fromJson(messageJson));
  }
}

Future sentData(Map<String, dynamic> messageJson) async {
  var Url =
      ApiConstant().baseUrl + ApiConstant().server + ApiConstant().writeData;
  var response =
      await http.post(Uri.parse(Url), body: json.encode(messageJson));

}
