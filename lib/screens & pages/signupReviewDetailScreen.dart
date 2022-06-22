import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers & bindings/controllers/signupScreenController.dart';
import '../data/constants/app_constants.dart';
import '../widgets/customBackButton.dart';
import '../widgets/customButton.dart';

class SignupReviewUserDetailsScreen extends StatelessWidget {
  SignupReviewUserDetailsScreen({Key? key}) : super(key: key);

  SignupScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Text(
          'Review Details',
          style: AppConstants.appTitle_TextStyle,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: AppConstants.globalPadding,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<SignupScreenController>(
                      init: SignupScreenController(),
                      builder: (moduleController) {
                        return controller.profileImage == null
                            ? Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: AppConstants.lightGrey,
                                      borderRadius: BorderRadius.circular(
                                        150,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        Get.height / 3,
                                      ),
                                      child: Image.asset(
                                        'asset/images/user_image.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: AppConstants.customWhite
                                          .withOpacity(.6),
                                      borderRadius: BorderRadius.circular(
                                        150,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      moduleController.selectProfileImage();
                                    },
                                    icon: Icon(
                                      Icons.add_a_photo,
                                      color: AppConstants.secondaryColor,
                                      size: 25,
                                    ),
                                  )
                                ],
                              )
                            : Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    150,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: double.maxFinite,
                                  backgroundImage: MemoryImage(
                                    moduleController.profileImage!,
                                  ),
                                ),
                              );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: AppConstants.body_TextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppConstants.primaryColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.withOpacity(.2),
                          width: .5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        controller.usernameTextEditingController.value.text,
                        style: AppConstants.body_TextStyle.copyWith(
                          color: AppConstants.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address',
                          style: AppConstants.body_TextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppConstants.primaryColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.withOpacity(.2),
                          width: .5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        controller.emailTextEditingController.value.text,
                        style: AppConstants.body_TextStyle.copyWith(
                          color: AppConstants.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: AppConstants.body_TextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppConstants.primaryColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey.withOpacity(.2),
                          width: .5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        controller.phoneTextEditingController.value.text,
                        style: AppConstants.body_TextStyle.copyWith(
                          color: AppConstants.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      callBackFunction: () {},
                      title: "Register",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
