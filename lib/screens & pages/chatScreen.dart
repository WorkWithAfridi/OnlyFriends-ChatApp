import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/viewControllers/chatScreenController.dart';
import 'package:only_friends/data/models/messageModel.dart';
import 'package:only_friends/widgets/chatBoxLayout/adminMessage.dart';
import '../data/constants/app_constants.dart';
import '../data/models/userModel.dart';
import '../widgets/chatBoxLayout/userOneChatMessageLayout.dart';
import '../widgets/chatBoxLayout/userTwoChatMessageLayout.dart';
import '../widgets/customBackButton.dart';
import '../widgets/customCircularProgressLoadingIndicator.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatScreenController chatScreenController = Get.find();

  AuthenticationController authenticationController = Get.find();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setListViewPosition();
  }

  setListViewPosition() async {
    if (scrollController.hasClients) {
      print('has clients');
      scrollController.jumpTo(
          chatScreenController.scrollController.position.maxScrollExtent);
    }
    print('doesnt have clients');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        elevation: 2,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              chatScreenController.chatFriendUserModel.username,
              style: AppConstants.body_TextStyle,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Active now",
                  style: AppConstants.body_TextStyle.copyWith(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                )
              ],
            )
          ],
        ),
        actions: [
          SizedBox(
            width: 30,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                size: 20,
                color: AppConstants.secondaryColor,
              ),
            ),
          ),
          SizedBox(
            width: 30,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call,
                size: 25,
                color: AppConstants.primaryColor,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chatChannels')
                  .doc(chatScreenController.chatChannelId)
                  .collection('messages')
                  .orderBy(
                    'messageId',
                    descending: false,
                  )
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CustomCircularProgressLoadingIndicator();
                }
                return Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      MessageModel messageModel = MessageModel.fromSnapshot(
                        snapshot.data!.docs[index],
                      );
                      if (messageModel.ownerUid ==
                          authenticationController.userModel!.uid) {
                        return UserOneChatMessageLayout(
                          messageModel: messageModel,
                        );
                      }
                      if (messageModel.ownerUid ==
                          chatScreenController.chatFriendUserModel.uid) {
                        return UserTwoChatMessageLayout(
                          friendUserModel:
                              chatScreenController.chatFriendUserModel,
                          messageModel: messageModel,
                        );
                      }
                      if (messageModel.ownerUid == "admin") {
                        return AdminMessage(message: messageModel.message);
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                );
              },
            ),
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.emoji_emotions,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(() => TextField(
                          style: AppConstants.body_TextStyle.copyWith(
                            color: Colors.black.withOpacity(.8),
                          ),
                          textInputAction: TextInputAction.next,
                          cursorColor: AppConstants.primaryColor,
                          controller: chatScreenController
                              .messageTextEditingController.value,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "Write message",
                            hintStyle: AppConstants.body_TextStyle.copyWith(
                              color: Colors.black.withOpacity(.5),
                            ),
                            border: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(
                                context,
                                color: Colors.grey,
                                width: .5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(
                                context,
                                color: Colors.grey,
                                width: .5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            // fillColor: primaryColor.withOpacity(.05),
                            // filled: true,
                            contentPadding: const EdgeInsets.all(8),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: false,
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      chatScreenController.sendMessage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'SEND',
                        style: AppConstants.labelMid_TextStyle.copyWith(
                          color: AppConstants.secondaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
