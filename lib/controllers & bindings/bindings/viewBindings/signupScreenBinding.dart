import 'package:get/get.dart';

import '../../controllers/viewControllers/signupScreenController.dart';


class SignupScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignupScreenController(),
    );
  }
}
