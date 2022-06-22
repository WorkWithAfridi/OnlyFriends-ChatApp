import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/authenticationController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
  }
}
