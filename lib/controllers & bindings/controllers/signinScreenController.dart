import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_friends/routing/routes.dart';

import '../../data/constants/app_constants.dart';
import '../../widgets/functionalWidgets/customSnackbar.dart';
import 'authenticationController.dart';

class SigninScreenController extends GetxController {
  var emailTextEditingController = TextEditingController().obs;
  var passwordTextEditingController = TextEditingController().obs;

  var showSigninButtonLoadingAnimation = false.obs;

  final AuthenticationController _authController = Get.find();

  void onSigninButtonClick() async {
    String emailAddress = emailTextEditingController.value.text;
    String password = passwordTextEditingController.value.text;
    if (emailAddress.isNotEmpty && password.isNotEmpty) {
      showSigninButtonLoadingAnimation.value = true;
      await Future.delayed(AppConstants.waitTime);
      String isSuccess = await _authController.signinUser(
          emailAddress: emailAddress, password: password);
      if (isSuccess == "Success") {
        _resetTextFields();
        Get.offAllNamed(ROUTES.getHomeFrameRoute);
      } else {
        String errorMessage = isSuccess;

        showCustomSnackBar(
          title: "Error",
          message: errorMessage,
          isError: true,
        );
      }
    } else {
      showCustomSnackBar(
        title: "Error",
        message: "User credentials cannot be empty!",
        isError: true,
      );
    }
    showSigninButtonLoadingAnimation.value = false;
  }

  void _resetTextFields() {
    emailTextEditingController.value.text = "";
    passwordTextEditingController.value.text = "";
  }
}
