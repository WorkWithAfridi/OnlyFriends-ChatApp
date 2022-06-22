import 'package:get/get.dart';

import '../controllers/signupScreenController.dart';

class SignupScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignupScreenController(),
    );
  }
}
