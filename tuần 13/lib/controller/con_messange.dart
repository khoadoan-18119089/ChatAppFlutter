import 'dart:convert';

import 'package:chat_messanger_ui/model/mess_model.dart';
import 'package:dio/dio.dart';

import '../controller/apiconstant.dart';
import 'package:chat_messanger_ui/constant/constant.dart';


Future getData(Dio dio) async {
  var _baseUrl =
      ApiConstant().baseUrl + ApiConstant().server + ApiConstant().readDataUrl;
  var response = await dio.get(_baseUrl);
  var data = jsonDecode(response.data);
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

Future sentData(Map<String, dynamic> messageJson, Dio dio) async {
  var _baseUrl =
      ApiConstant().baseUrl + ApiConstant().server + ApiConstant().writeDataUrl;
  await dio.post(_baseUrl, data: json.encode(messageJson));
}
