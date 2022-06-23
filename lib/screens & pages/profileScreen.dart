import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/profileScreenController.dart';

import '../data/constants/app_constants.dart';
import '../routing/routes.dart';
import '../widgets/customBackButton.dart';
import '../widgets/customDivider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  ProfileScreenController controller = Get.find();
  AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: const Text(
          'Profile',
          style: AppConstants.appTitle_TextStyle,
        ),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        authenticationController.userModel!.profilePictureUrl,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      authenticationController.userModel!.username,
                      style: AppConstants.labelMid_TextStyle
                          .copyWith(fontSize: 18),
                    ),
                    Text(
                      authenticationController.userModel!.emailAddress,
                      style: AppConstants.body_TextStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                          ClipboardData(
                            text: authenticationController
                                .userModel!.userUniqueId,
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "OnlyFriends ID",
                            style: AppConstants.body_TextStyle.copyWith(
                              color: AppConstants.darkGrey,
                            ),
                          ),
                          Text(
                            authenticationController.userModel!.userUniqueId,
                            style: AppConstants.body_TextStyle.copyWith(
                              color: AppConstants.secondaryColor,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          authenticationController.userModel!.bio ==
                                  "Available on OnlyFriends!"
                              ? Column(
                                  children: [
                                    Text(
                                      authenticationController.userModel!.bio,
                                      style:
                                          AppConstants.body_TextStyle.copyWith(
                                        color: AppConstants.darkGrey,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Edit bio ",
                                          style: AppConstants.body_TextStyle
                                              .copyWith(
                                            color: AppConstants.primaryColor,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.edit,
                                          color: AppConstants.primaryColor,
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : Text(
                                  "OnlyFriends ID",
                                  style: AppConstants.body_TextStyle.copyWith(
                                    color: AppConstants.darkGrey,
                                  ),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: AppConstants.globalPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Account',
                          style: AppConstants.body_TextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const CustomDivider(gap: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.chat,
                          color: Colors.orange,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Chat',
                          style: AppConstants.body_TextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const CustomDivider(gap: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.storage,
                          color: Colors.blueAccent,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Storage',
                          style: AppConstants.body_TextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const CustomDivider(gap: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.notifications,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Notification',
                          style: AppConstants.body_TextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const CustomDivider(gap: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.trip_origin,
                          color: Colors.pink,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Application Info',
                          style: AppConstants.body_TextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const CustomDivider(gap: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.help_center,
                          color: Colors.greenAccent,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Help Center",
                          style: AppConstants.body_TextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    const CustomDivider(gap: 10),
                    GestureDetector(
                      onTap: () {
                        controller.onSignoutButtonClick();
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.logout,
                              color: Colors.redAccent,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Signout",
                              style: AppConstants.body_TextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
