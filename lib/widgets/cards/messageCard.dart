import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/data/models/chatChannelModel.dart';
import '../../data/constants/app_constants.dart';
import '../../data/models/userModel.dart';
import '../../routing/routes.dart';
import '../functionalWidgets/showPopUpContactDetails.dart';
import '../customDivider.dart';

class MessageCard extends StatelessWidget {
  final ChatChannelModel chatModel;
  MessageCard({
    Key? key,
    required this.chatModel,
  }) : super(key: key);

  // late Future<UserModel> friendUserModel = getMessageData();

  final AuthenticationController authenticationController = Get.find();

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
                            // showUserDataPopUp();
                            // print('clicked');
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
                                  height: 1.1,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.",
                                style: AppConstants.body_TextStyle.copyWith(
                                  color: Colors.black.withOpacity(.75),
                                  height: .95,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "12:45 PM",
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
            return const Text('error 2');
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          // Future in progress
          return SizedBox.shrink();
        } else {
          return Text("State: ${snapshot.connectionState}");
        }
      },
    );
  }
}
