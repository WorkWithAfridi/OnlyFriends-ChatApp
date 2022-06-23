import 'package:get/get.dart';

import '../../controllers/viewControllers/chatScreenController.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatScreenController());
  }
}
