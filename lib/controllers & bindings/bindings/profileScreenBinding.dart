import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

import '../controllers/profileScreenController.dart';

class ProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileScreenController());
  }
}
