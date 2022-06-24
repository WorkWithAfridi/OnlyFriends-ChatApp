import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/data/models/userModel.dart';
import 'package:only_friends/routing/routes.dart';
import '../../../widgets/cards/contactCard.dart';
import '../../../widgets/customDivider.dart';
import '../data/constants/app_constants.dart';
import '../widgets/customCircularProgressLoadingIndicator.dart';
import 'addAContactScreen.dart';
import 'createReferralCodeScreen.dart';

class YourContactsPage extends StatelessWidget {
  YourContactsPage({Key? key}) : super(key: key);
  AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: double.maxFinite,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: AppConstants.globalPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 50,
                    width: Get.height,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.05),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    padding: AppConstants.globalPadding,
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          size: 15,
                          color: AppConstants.darkGrey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Search",
                          style: AppConstants.labelMid_TextStyle.copyWith(
                            color: AppConstants.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(ROUTES.getAddAContractScreenRoute);
                    },
                    child: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: AppConstants.customGradient,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                              color: AppConstants.customWhite,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Add New Contact",
                            style: AppConstants.body_TextStyle.copyWith(
                              color: AppConstants.darkGrey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomDivider(gap: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: AppConstants.customGradient,
                        ),
                        child: const Icon(
                          Icons.group_add,
                          size: 20,
                          color: AppConstants.customWhite,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Create Group",
                        style: AppConstants.body_TextStyle.copyWith(
                          color: AppConstants.darkGrey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const CustomDivider(gap: 8),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const CreateReferralCodeScreen(),
                      );
                    },
                    child: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green,
                              gradient: AppConstants.customGradient,
                            ),
                            child: const Icon(
                              FontAwesomeIcons.gift,
                              size: 18,
                              color: AppConstants.customWhite,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Generate Referral Code",
                            style: AppConstants.body_TextStyle.copyWith(
                              color: AppConstants.darkGrey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Your contacts",
                    style: AppConstants.labelMid_TextStyle.copyWith(
                      color: Colors.black.withOpacity(.8),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ContactCard(
                    userModel: authenticationController.userModel!,
                  ),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .where(
                          "userUniqueId",
                          whereIn:
                              authenticationController.userModel!.friendList,
                        )
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CustomCircularProgressLoadingIndicator();
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          UserModel contactUserModel = UserModel.fromSnapshot(
                            snapshot.data!.docs[index],
                          );
                          if (contactUserModel.uid ==
                              authenticationController.userModel!.uid) {
                            return const SizedBox.shrink();
                          }
                          return ContactCard(
                            userModel: contactUserModel,
                          );
                        },
                      );
                    },
                  ),
                  // ListView.builder(
                  //   itemCount: 10,
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     return ContactCard();
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
