import 'package:get/get.dart';

import '../../routing/routes.dart';

class SplashScreenController extends GetxController {
  void triggerSplashScreeen() async {
    await Future.delayed(
      const Duration(milliseconds: 1500),
    );
    Get.offNamed(
      ROUTES.getOnBoardingScreenRoute,
    );
  }
}
