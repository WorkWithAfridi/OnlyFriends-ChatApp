import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';

import '../../../routing/routes.dart';

class SplashScreenController extends GetxController {
  AuthenticationController authController = Get.find();

  void triggerSplashScreeen() async {
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    bool isUserSignedin = await authController.isUserSignedIn();
    if (isUserSignedin) {
      Get.offAllNamed(ROUTES.getHomeFrameRoute);
    } else {
      var isFirstBoot = await checkIfFirstBoot();
      if (isFirstBoot) {
        Get.offNamed(
          ROUTES.getOnBoardingScreenRoute,
        );
      } else {
        Get.offNamed(
          ROUTES.getSigninScreenRoute,
        );
      }
    }
  }

  Future<bool> checkIfFirstBoot() async {
    var box = GetStorage();
    var isFirstBoot = await box.read("isFirstBoot");
    if (isFirstBoot == null) {
      box.write("isFirstBoot", false);
      return true;
    } else {
      return false;
    }
  }
}
