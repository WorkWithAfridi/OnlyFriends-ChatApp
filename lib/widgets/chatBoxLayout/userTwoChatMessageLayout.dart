import 'package:flutter/material.dart';
import 'package:only_friends/data/models/messageModel.dart';

import '../../data/constants/app_constants.dart';
import '../../data/models/userModel.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserTwoChatMessageLayout extends StatelessWidget {
  final MessageModel messageModel;
  final UserModel friendUserModel;
  const UserTwoChatMessageLayout({
    Key? key,
    required this.messageModel,
    required this.friendUserModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50, bottom: 10, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(
              friendUserModel.profilePictureUrl,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                      color: AppConstants.chatBoxUserTwoColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )),
                  child: Text(
                    messageModel.message,
                    style: AppConstants.body_TextStyle,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      timeago.format(DateTime.parse(messageModel.messageId)),
                      style: AppConstants.labelMid_TextStyle.copyWith(
                        color: AppConstants.lightGrey,
                        fontSize: 10,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
