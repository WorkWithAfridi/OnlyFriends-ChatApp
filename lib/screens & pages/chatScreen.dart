import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../data/constants/app_constants.dart';
import '../widgets/chatBoxLayout/userOneChatMessageLayout.dart';
import '../widgets/chatBoxLayout/userTwoChatMessageLayout.dart';
import '../widgets/customBackButton.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

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
              "Khondakar Bushra",
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
              icon: Icon(
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
              icon: Icon(
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
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: 25,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return UserTwoChatMessageLayout();
                      },
                    ),
                    UserOneChatMessageLayout()
                  ],
                ),
              ),
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
                    child: TextField(
                      style: AppConstants.body_TextStyle.copyWith(
                        color: Colors.black.withOpacity(.8),
                      ),
                      textInputAction: TextInputAction.next,
                      cursorColor: AppConstants.primaryColor,
                      controller: TextEditingController(),
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
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'SEND',
                      style: AppConstants.labelMid_TextStyle.copyWith(
                        color: AppConstants.secondaryColor,
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
