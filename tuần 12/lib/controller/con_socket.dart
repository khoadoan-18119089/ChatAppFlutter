import 'package:chat_messanger_ui/controller/apiconstant.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../model/mess_model.dart';
import 'chat_controller.dart';
import 'package:chat_messanger_ui/constant/constant.dart';

Future Con_Socket(ChatController chatController) async {
  var Url = ApiConstant().baseUrl + ApiConstant().postSocket;
  socket = IO.io(
      Url,
      IO.OptionBuilder()
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
