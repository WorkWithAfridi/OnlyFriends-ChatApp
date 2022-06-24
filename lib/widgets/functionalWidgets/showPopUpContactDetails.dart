import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/firebaseController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/chatScreenController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/profileScreenController.dart';
import 'package:only_friends/data/models/userModel.dart';
import 'package:only_friends/screens%20&%20pages/chatScreen.dart';

import '../../data/constants/app_constants.dart';

void showUserDataPopUp({required UserModel userModel}) {
  Get.dialog(
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 100,
      ),
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppConstants.customWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 350,
                      width: double.maxFinite,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          userModel.profilePictureUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 350,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.3),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: AppConstants.globalPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userModel.username,
                                style: AppConstants.labelMid_TextStyle
                                    .copyWith(fontSize: 18),
                              ),
                              Text(userModel.bio,
                                  style: AppConstants.body_TextStyle.copyWith(
                                    color: AppConstants.darkGrey,
                                  )),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                AuthenticationController
                                    authenticationController = Get.find();
                                FirebaseController firebaseController =
                                    Get.find();
                                String isSuccess = await firebaseController
                                    .startANewChatChannel(
                                  friendUid: userModel.uid,
                                  userUid:
                                      authenticationController.userModel!.uid,
                                );

                                Get.lazyPut(() => ChatScreenController());
                                Get.back();
                                ChatScreenController
                                    chatScreenController = Get.find();

                                chatScreenController.chatFriendUserModel =
                                    userModel;
                                chatScreenController.chatChannelId =
                                    isSuccess.substring(
                                  7,
                                  isSuccess.length,
                                );
                                Get.to(
                                  () => ChatScreen(),
                                );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: AppConstants.customGradientTwo,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.chat,
                                      size: 20,
                                      color: AppConstants.customWhite,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Start a Conversation",
                                      style: AppConstants.labelMid_TextStyle
                                          .copyWith(
                                        fontSize: 12,
                                        color: AppConstants.customWhite,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(
                                colors: [
                                  AppConstants.primaryColor,
                                  AppConstants.secondaryColor,
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                            ),
                            child: Icon(
                              Icons.phone,
                              size: 20,
                              color: AppConstants.customWhite,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.block,
                            color: Colors.red,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Block this user',
                            style: AppConstants.labelMid_TextStyle.copyWith(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.close,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Unfriend ',
                            style: AppConstants.labelMid_TextStyle.copyWith(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Delete all chat',
                            style: AppConstants.labelMid_TextStyle.copyWith(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
