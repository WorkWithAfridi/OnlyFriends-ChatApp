import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/signinScreenController.dart';

class SigninScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SigninScreenController(),
    );
  }
}
