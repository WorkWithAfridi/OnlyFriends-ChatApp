import 'package:get/get.dart';

import '../../routing/routes.dart';

class OnBoardingScreenController extends GetxController {
  var pageIndex = 0.obs;
  void moveToNextPage() {
    if (pageIndex.value != 2) {
      pageIndex.value++;
    }
  }

  void onSkipOrBackButtonPressed() {
    if (pageIndex.value == 0) {
      Get.offNamed(ROUTES.getSigninScreenRoute);
    } else {
      pageIndex.value--;
    }
  }

  void getStarted() {
    Get.offNamed(ROUTES.getSigninScreenRoute);
  }
}
