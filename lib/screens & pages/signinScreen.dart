import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/signinScreenController.dart';

import '../data/constants/app_constants.dart';
import '../routing/routes.dart';
import '../widgets/appData/appIconTitle.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import 'forgotPasswordScreen.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);

  SigninScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppIconTitle(),
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
              const Text(
                'Signin',
                style: AppConstants.appTitle_TextStyle,
              ),
              Text(
                "to continue using the app!",
                style: AppConstants.body_TextStyle.copyWith(
                  color: Colors.black.withOpacity(.8),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GetTextField(
                textEditingController:
                    controller.emailTextEditingController.value,
                hintText: "Email address or Phone number...",
                textInputType: TextInputType.emailAddress,
                maxLines: 1,
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ForgotPasswordScreen(),
                      );
                    },
                    child: Text(
                      'Forgot password?',
                      style: AppConstants.body_TextStyle.copyWith(
                        color: Colors.black.withOpacity(.8),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(() => CustomButton(
                    callBackFunction: () {
                      controller.onSigninButtonClick();
                    },
                    title: "Signin",
                    isLoading:
                        controller.showSigninButtonLoadingAnimation.value,
                  )),
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
                    "Don't have an account? ",
                    style: AppConstants.body_TextStyle.copyWith(
                      color: Colors.black.withOpacity(.8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(ROUTES.getSignupScreenRoute);
                    },
                    child: Text(
                      "Sign Up",
                      style: AppConstants.body_TextStyle.copyWith(
                          color: AppConstants.secondaryColor.withOpacity(.8),
                          fontWeight: FontWeight.bold),
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
