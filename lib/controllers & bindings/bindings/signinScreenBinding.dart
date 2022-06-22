import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/signinScreenController.dart';

class SigninScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SigninScreenController(),
    );
  }
}
