import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/chatScreenController.dart';
import 'package:only_friends/data/models/chatChannelModel.dart';
import 'package:only_friends/data/models/messageModel.dart';
import '../../data/constants/app_constants.dart';
import '../../data/models/userModel.dart';
import '../../routing/routes.dart';
import '../functionalWidgets/showPopUpContactDetails.dart';
import '../customDivider.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageCard extends StatelessWidget {
  final ChatChannelModel chatModel;
  MessageCard({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  final AuthenticationController authenticationController = Get.find();
  late MessageModel messageModel;

  Future<UserModel> getChatUserData() async {
    late UserModel temp;
    for (int i = 0; i < chatModel.users.length; i++) {
      if (chatModel.users[i] != authenticationController.userModel!.uid) {
        temp = UserModel.fromSnapshot(
          await FirebaseFirestore.instance
              .collection('users')
              .doc(chatModel.users[i])
              .get(),
        );
      }
    }

    // messageModel = MessageModel.fromSnapshot(await FirebaseFirestore.instance
    //     .collection('chatChannels')
    //     .doc(chatModel.chatChannelId)
    //     .collection('messages')
    //     .snapshots()
    //     .last);

    print(chatModel.chatChannelId);

    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('chatChannels')
          .doc(chatModel.chatChannelId)
          .collection('messages')
          .get();
      messageModel = MessageModel.fromSnapshot(snapshot.docs.last);
    } catch (e) {
      print(e.toString());
    }
    print('returning');

    // print(FirebaseFirestore.instance
    //     .collection('chatChannels')
    //     .doc(chatModel.chatChannelId)
    //     .collection('messages')
    //     .snapshots()
    //     .last.);
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
      future: getChatUserData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Future resolved check if it has error
          if (snapshot.hasError) {
            return const Text("error fetching data!");
          } else if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.put(ChatScreenController());
                    ChatScreenController chatScreenController = Get.find();
                    chatScreenController.chatChannelId.value =
                        chatModel.chatChannelId;
                    chatScreenController.chatFriendUserModel = snapshot.data;
                    Get.toNamed(ROUTES.getChatScreenRoute);
                  },
                  child: Container(
                    height: 50,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showUserDataPopUp(userModel: snapshot.data);
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  snapshot.data!.profilePictureUrl,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.username,
                                style: AppConstants.labelMid_TextStyle.copyWith(
                                  color: AppConstants.primaryColor,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                messageModel.ownerUid !=
                                        authenticationController.userModel!.uid
                                    ? messageModel.message
                                    : "You: " + messageModel.message,
                                style: AppConstants.body_TextStyle.copyWith(
                                  color: Colors.black.withOpacity(.65),
                                  height: 1,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          timeago
                              .format(DateTime.parse(messageModel.messageId)),
                          style: AppConstants.labelMid_TextStyle.copyWith(
                            fontSize: 10,
                            color: AppConstants.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomDivider(gap: 10),
              ],
            );
          } else {
            return const Text('has no data');
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          // Future in progress
          return const SizedBox.shrink();
        } else {
          return Text("State: ${snapshot.connectionState}");
        }
      },
    );
  }
}
