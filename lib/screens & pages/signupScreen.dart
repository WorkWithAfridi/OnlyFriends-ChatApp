import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers & bindings/controllers/signupScreenController.dart';
import '../data/constants/app_constants.dart';
import '../widgets/customBackButton.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  SignupScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(
          'New user?',
          style: AppConstants.appTitle_TextStyle,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: AppConstants.globalPadding,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Signup',
                style: AppConstants.appTitle_TextStyle,
              ),
              Text(
                "Signup now! It's FREE!",
                style: AppConstants.body_TextStyle.copyWith(
                  color: Colors.black.withOpacity(.8),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GetTextField(
                textEditingController:
                    controller.usernameTextEditingController.value,
                hintText: "Username",
                textInputType: TextInputType.emailAddress,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              GetTextField(
                textEditingController:
                    controller.emailTextEditingController.value,
                hintText: "Email address",
                textInputType: TextInputType.emailAddress,
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              GetTextField(
                textEditingController:
                    controller.phoneTextEditingController.value,
                hintText: "Phone number",
                textInputType: TextInputType.number,
                maxLines: 1,
                isPass: true,
              ),
              const SizedBox(
                height: 10,
              ),
              GetTextField(
                textEditingController:
                    controller.passwordTextEditingController.value,
                hintText: "Password",
                textInputType: TextInputType.text,
                maxLines: 1,
                isPass: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                callBackFunction: controller.onNextButtonClick,
                title: "Next",
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Or ",
                    style: AppConstants.body_TextStyle.copyWith(
                      color: Colors.black.withOpacity(.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: Get.height,
                decoration: BoxDecoration(
                  color: AppConstants.facebookBlue,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Signup with Facebook",
                  style: AppConstants.labelMid_TextStyle.copyWith(
                    color: AppConstants.customWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: Get.height,
                decoration: BoxDecoration(
                  color: AppConstants.googleRed,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Signup with Google",
                  style: AppConstants.labelMid_TextStyle.copyWith(
                    color: AppConstants.customWhite,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppConstants.body_TextStyle.copyWith(
                      color: Colors.black.withOpacity(.8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "Sign In",
                      style: AppConstants.body_TextStyle.copyWith(
                        color: AppConstants.secondaryColor.withOpacity(.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
