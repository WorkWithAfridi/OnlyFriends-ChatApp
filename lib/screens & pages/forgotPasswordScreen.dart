import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../data/constants/app_constants.dart';
import '../widgets/appData/appIcon.dart';
import '../widgets/customBackButton.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
              'Forgot your password??',
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
              "No problem. Enter the email address you used to register your account and we'll send you a reset link. :)",
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
              hintText: "Email Address",
              textInputType: TextInputType.emailAddress,
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              callBackFunction: () {},
              title: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
