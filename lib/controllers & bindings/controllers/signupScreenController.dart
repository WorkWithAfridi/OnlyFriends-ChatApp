import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../screens & pages/signupReviewDetailScreen.dart';
import '../../services/imageServices.dart';
import '../../widgets/functionalWidgets/customSnackbar.dart';

class SignupScreenController extends GetxController {
  Uint8List? profileImage;
  var usernameTextEditingController = TextEditingController().obs;
  var emailTextEditingController = TextEditingController().obs;
  var phoneTextEditingController = TextEditingController().obs;
  var passwordTextEditingController = TextEditingController().obs;

  selectProfileImage() async {
    var selectedImage = await ImageServices().pickImage(ImageSource.gallery);
    if (selectedImage != null) {
      profileImage = selectedImage;
      update();
    }
  }

  onNextButtonClick() {
    if (_isSignupFormFilled == true) {
      Get.to(
        () => SignupReviewUserDetailsScreen(),
      );
    } else {
      showCustomSnackBar(
        title: "Error",
        message: "User credentials cannot be left empty!",
        isError: true,
      );
    }
  }

  bool _isSignupFormFilled() {
    return false;
  }
}
