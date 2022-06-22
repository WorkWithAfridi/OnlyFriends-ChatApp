import 'package:get/get.dart';

import '../controllers/chatScreenController.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatScreenController());
  }
}
