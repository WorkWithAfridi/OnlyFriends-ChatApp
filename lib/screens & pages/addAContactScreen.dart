import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/addAContactScreenController.dart';
import 'package:only_friends/widgets/customButton.dart';
import '../../../../widgets/customBackButton.dart';
import '../data/constants/app_constants.dart';
import '../widgets/appData/appIcon.dart';
import '../widgets/customTextField.dart';

class AddAContactScreen extends StatelessWidget {
  AddAContactScreen({Key? key}) : super(key: key);

  AddAContractScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: AppConstants.globalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Adding a new Contact??',
              style: AppConstants.appTitle_TextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            const AppIcon(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Just paste in their OnlyFriends ID, and start chatting! :)",
              style: AppConstants.body_TextStyle.copyWith(
                color: AppConstants.darkGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            GetTextField(
              textEditingController:
                  controller.onlyFriendsIdTextEditingController.value,
              hintText: "OnlyFriends ID",
              textInputType: TextInputType.text,
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            Obx(
              () => CustomButton(
                callBackFunction: () {
                  controller.onAddButtonClick();
                },
                title: "Add",
                isLoading: controller.showAddButtonLoadingAnimation.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
