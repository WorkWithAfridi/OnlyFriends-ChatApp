import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/globalControllers/authenticationController.dart';
import 'package:only_friends/data/models/userModel.dart';

import '../../data/constants/app_constants.dart';
import '../functionalWidgets/showPopUpContactDetails.dart';
import '../customDivider.dart';

class ContactCard extends StatelessWidget {
  final UserModel userModel;
  ContactCard({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showUserDataPopUp(userModel: userModel);
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(userModel.profilePictureUrl),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Row(
                children: [
                  Text(
                    userModel.username,
                    style: AppConstants.labelMid_TextStyle.copyWith(
                      color: Colors.black.withOpacity(.8),
                      fontSize: 12,
                    ),
                  ),
                  userModel.userUniqueId ==
                          authenticationController.userModel!.userUniqueId
                      ? Text(
                          " (You)",
                          style: AppConstants.labelMid_TextStyle.copyWith(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 12,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
        const CustomDivider(gap: 8),
      ],
    );
  }
}
