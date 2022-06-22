import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../data/constants/app_constants.dart';
import '../routing/routes.dart';
import '../widgets/appData/appIcon.dart';
import '../widgets/customBackButton.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

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
            Text(
              'Verification',
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
              "Please check your SMS messages. We've sent you a SMS with a verification PIN on it, to verify your account. :)",
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
              hintText: "Enter PIN code...",
              textInputType: TextInputType.emailAddress,
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Didn't receive a code?  ",
                  style: AppConstants.body_TextStyle.copyWith(
                    color: Colors.black.withOpacity(.4),
                  ),
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Sent again!",
                    style: AppConstants.body_TextStyle.copyWith(
                        color: AppConstants.secondaryColor.withOpacity(.8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              callBackFunction: () {
                Get.offAllNamed(ROUTES.getHomeFrameRoute);
              },
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
