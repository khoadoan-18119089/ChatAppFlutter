import 'package:get/get.dart';

import '../model/mess_model.dart';

class ChatController extends GetxController {
  var chatMess = <Message>[].obs;
  var connectedUser = 0.obs;
}
