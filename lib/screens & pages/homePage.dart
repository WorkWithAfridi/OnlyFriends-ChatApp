import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/data/models/chatChannelModel.dart';
import 'package:only_friends/data/models/userModel.dart';
import 'package:only_friends/widgets/customCircularProgressLoadingIndicator.dart';
import '../../widgets/cards/messageCard.dart';
import '../../widgets/cards/storyCard.dart';
import '../controllers & bindings/controllers/viewControllers/homeFrameController.dart';
import '../data/constants/app_constants.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeFrameController homeFrameController = Get.find();
  AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "It's quite empty down here. :)\n Maybe add someone and start chatting!!",
                  textAlign: TextAlign.center,
                  style: AppConstants.body_TextStyle.copyWith(
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeFrameController.pageIndex.value = 1;
                    homeFrameController.homeFramePageController.value
                        .jumpToPage(
                      1,
                    );
                  },
                  child: Text(
                    "Get Started!!",
                    style: AppConstants.body_TextStyle.copyWith(
                        color: AppConstants.secondaryColor.withOpacity(.8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Active",
                          style: AppConstants.labelMid_TextStyle.copyWith(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "See all",
                          style: AppConstants.body_TextStyle.copyWith(
                            color: AppConstants.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 75,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          StoryCard(
                            userModel: authenticationController.userModel!,
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .where(
                                  "userUniqueId",
                                  whereIn: authenticationController
                                      .userModel!.friendList,
                                )
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<
                                        QuerySnapshot<Map<String, dynamic>>>
                                    snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CustomCircularProgressLoadingIndicator();
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  UserModel storyUserModel =
                                      UserModel.fromSnapshot(
                                    snapshot.data!.docs[index],
                                  );
                                  if (storyUserModel.uid ==
                                      authenticationController.userModel!.uid) {
                                    return const SizedBox.shrink();
                                  }
                                  return StoryCard(
                                    userModel: storyUserModel,
                                  );
                                },
                              );
                            },
                          ),
                          // ListView.builder(
                          //   itemCount: 10,
                          //   shrinkWrap: true,
                          //   physics: const NeverScrollableScrollPhysics(),
                          //   scrollDirection: Axis.horizontal,
                          //   itemBuilder: (context, index) {
                          //     return StoryCard();
                          //   },
                          // ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: AppConstants.globalPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recent Chats",
                          style: AppConstants.labelMid_TextStyle.copyWith(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('chatChannels')
                              .where(
                                "chatChannelId",
                                whereIn: authenticationController
                                    .userModel!.chatChannels,
                              )
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CustomCircularProgressLoadingIndicator();
                            }
                            print(snapshot.data!.docs.length);
                            if (snapshot.data!.docs.length < 1) {
                              return Container(
                                width: double.maxFinite,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "It's quite empty down here. :)\n Maybe add someone and start chatting!!",
                                      textAlign: TextAlign.center,
                                      style:
                                          AppConstants.body_TextStyle.copyWith(
                                        color: Colors.black.withOpacity(.7),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        homeFrameController.pageIndex.value = 1;
                                        homeFrameController
                                            .homeFramePageController.value
                                            .jumpToPage(
                                          1,
                                        );
                                      },
                                      child: Text(
                                        "Get Started!!",
                                        style: AppConstants.body_TextStyle
                                            .copyWith(
                                                color: AppConstants
                                                    .secondaryColor
                                                    .withOpacity(.8),
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return MessageCard(
                                  chatModel: ChatChannelModel.fromSnapshot(
                                    snapshot.data!.docs[index],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
