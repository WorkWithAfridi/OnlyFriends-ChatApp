import 'package:get/get.dart';

import '../../controllers/viewControllers/splashScreenController.dart';

class SplashScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashScreenController(),
    );
  }
}
