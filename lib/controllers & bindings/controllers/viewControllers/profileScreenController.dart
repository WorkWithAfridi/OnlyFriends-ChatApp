import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/data/models/userModel.dart';
import 'package:only_friends/routing/routes.dart';

import '../../../widgets/functionalWidgets/customSnackbar.dart';

class ProfileScreenController extends GetxController {

  final AuthenticationController _authController = Get.find();
  onSignoutButtonClick() async {
    String isSuccess = await _authController.signoutUser();
    if (isSuccess == 'Success') {
      Get.offAllNamed(ROUTES.getSigninScreenRoute);
    } else {
      String errorMessage = isSuccess;
      showCustomSnackBar(
        title: "Error",
        message: errorMessage,
        isError: true,
      );
    }
  }
}
