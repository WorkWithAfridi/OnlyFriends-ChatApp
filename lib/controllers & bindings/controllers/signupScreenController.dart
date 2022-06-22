import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:only_friends/data/constants/app_constants.dart';
import 'package:only_friends/routing/routes.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/authenticationController.dart';

import '../../screens & pages/signupReviewDetailScreen.dart';
import '../../services/imageServices.dart';
import '../../widgets/functionalWidgets/customSnackbar.dart';

class SignupScreenController extends GetxController {
  Uint8List? profileImage;
  var usernameTextEditingController = TextEditingController().obs;
  var emailTextEditingController = TextEditingController().obs;
  var phoneTextEditingController = TextEditingController().obs;
  var passwordTextEditingController = TextEditingController().obs;

  var showRegisterButtonLoadingAnimation = false.obs;
  final AuthenticationController _authController = Get.find();

  selectProfileImage() async {
    var selectedImage = await ImageServices().pickImage(ImageSource.gallery);
    if (selectedImage != null) {
      profileImage = selectedImage;
      update();
    }
  }

  onNextButtonClick() {
    if (_isSignupFormFilled()) {
      Get.to(
        () => SignupReviewUserDetailsScreen(),
      );
    } else {}
  }

  onRegisterButtonClick() async {
    if (profileImage != null) {
      showRegisterButtonLoadingAnimation.value = true;
      await Future.delayed(AppConstants.waitTime);
      String isSuccess = await _authController.signupUser(
        username: usernameTextEditingController.value.text,
        emailAddress: emailTextEditingController.value.text,
        phone: phoneTextEditingController.value.text,
        password: passwordTextEditingController.value.text,
        profilePictureFile: profileImage!,
      );
      if (isSuccess == "Success") {
        showCustomSnackBar(
          title: "Hello",
          message: "Welcome aboard on OnlyFriends! :D",
          isError: false,
        );
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
        message:
            "You need to upload a profile picture in order for your friends to recognize you! :)",
        isError: true,
      );
    }
    showRegisterButtonLoadingAnimation.value = false;
  }

  bool _isSignupFormFilled() {
    if (usernameTextEditingController.value.text.isNotEmpty ||
        emailTextEditingController.value.text.isNotEmpty ||
        phoneTextEditingController.value.text.isNotEmpty ||
        passwordTextEditingController.value.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  void _resetTextFields() {
    usernameTextEditingController.value.text = "";
    emailTextEditingController.value.text = "";
    phoneTextEditingController.value.text = "";
    passwordTextEditingController.value.text = "";
  }
}
