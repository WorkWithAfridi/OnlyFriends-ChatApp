import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/firebaseController.dart';
import 'package:only_friends/data/constants/app_constants.dart';
import 'package:only_friends/widgets/functionalWidgets/customSnackbar.dart';

class AddAContractScreenController extends GetxController {
  var onlyFriendsIdTextEditingController = TextEditingController().obs;

  FirebaseController firebaseController = Get.find();
  AuthenticationController authenticationController = Get.find();
  var showAddButtonLoadingAnimation = false.obs;

  onAddButtonClick() async {
    if (onlyFriendsIdTextEditingController.value.text.isNotEmpty) {
      showAddButtonLoadingAnimation.value = true;
      await Future.delayed(AppConstants.waitTime);
      String isSuccess = await firebaseController.addAContact(
          OnlyFriendId: onlyFriendsIdTextEditingController.value.text,
          userUid: authenticationController.userModel!.uid);
      if (isSuccess == "Success") {
        showCustomSnackBar(
            title: "Yaay!!", message: "You have a new friend! :)");
      } else {
        String errorMessage = isSuccess;
        showCustomSnackBar(
            title: "Error", message: errorMessage, isError: true);
      }
      showAddButtonLoadingAnimation.value = false;
    } else {
      showCustomSnackBar(
          title: "Error",
          message: "You need to add a valid OnlyFriends ID.",
          isError: true);
    }
  }
}
