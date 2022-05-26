import 'package:chat_messanger_ui/controller/apiconstant.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../model/mess_model.dart';
import 'chat_controller.dart';
import 'package:chat_messanger_ui/constant/constant.dart';

Future conSocket(ChatController chatController) async {
  var _baseUrl = ApiConstant().baseUrl + ApiConstant().postSocket;
  socket = io.io(
      _baseUrl,
      io.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build());
  setUpSocket(chatController);
  socket.connect();
}

void setUpSocket(ChatController chatController) {
  socket.on('message-receive', (data) {
    chatController.chatMess.add(Message.fromJson(data));
  });
  socket.on('connect-User', (data) {
    chatController.connectedUser.value = data;
  });
}
