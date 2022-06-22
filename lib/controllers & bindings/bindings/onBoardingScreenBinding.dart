import 'package:get/get.dart';

import '../controllers/onBoardingScreenController.dart';



class OnBoardingScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingScreenController());
  }
}
