import 'package:get/get.dart';

import '../../controllers/viewControllers/homeFrameController.dart';


class HomeFrameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeFrameController());
  }
}
