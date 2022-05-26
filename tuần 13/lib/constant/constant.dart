import 'package:socket_io_client/socket_io_client.dart' as io;

import '../controller/chat_controller.dart';

late io.Socket socket;
ChatController chatController = ChatController();
String? messageData;
