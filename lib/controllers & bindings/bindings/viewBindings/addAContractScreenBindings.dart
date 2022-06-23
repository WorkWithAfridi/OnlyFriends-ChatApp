import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/addAContactScreenController.dart';

class AddAContractScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAContractScreenController());
  }
}
