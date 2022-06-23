import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/firebaseController.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationController());
    Get.put(FirebaseController());
  }
}
