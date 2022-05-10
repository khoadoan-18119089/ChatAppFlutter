import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../controller/chat_controller.dart';

late IO.Socket socket;
ChatController chatController = ChatController();
String? messageData;
