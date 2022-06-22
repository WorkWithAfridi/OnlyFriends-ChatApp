import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../../widgets/customBackButton.dart';
import '../data/constants/app_constants.dart';
import '../widgets/appData/appIcon.dart';
import '../widgets/customTextField.dart';

class AddAContactScreen extends StatelessWidget {
  const AddAContactScreen({Key? key}) : super(key: key);

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
              "Just paste in their #USERID, and start chatting! :)",
              style: AppConstants.body_TextStyle.copyWith(
                color: Colors.black.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            GetTextField(
              textEditingController: TextEditingController(),
              hintText: "Enter user_id...",
              textInputType: TextInputType.text,
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                width: Get.height,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppConstants.primaryColor,
                      AppConstants.secondaryColor,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Add",
                  style: AppConstants.labelMid_TextStyle.copyWith(
                    color: AppConstants.customWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
