import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';

import '../../data/constants/app_constants.dart';
import '../../data/models/messageModel.dart';

class UserOneChatMessageLayout extends StatelessWidget {
  final MessageModel messageModel;
  UserOneChatMessageLayout({
    Key? key,
    required this.messageModel,
  }) : super(key: key);

  AuthenticationController authenticationController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, bottom: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    gradient: AppConstants.customGradient,
                  ),
                  child: Text(
                    messageModel.message,
                    style: AppConstants.body_TextStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        height: 17,
                      ),
                    ),
                    Text(
                      '12:00 sunday',
                      style: AppConstants.labelMid_TextStyle.copyWith(
                        color: AppConstants.lightGrey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
              authenticationController.userModel!.profilePictureUrl,
            ),
          ),
        ],
      ),
    );
  }
}
