import 'package:flutter/material.dart';
import 'package:only_friends/data/models/userModel.dart';

import '../../data/constants/app_constants.dart';

class StoryCard extends StatelessWidget {
  final UserModel userModel;
  const StoryCard({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  userModel.profilePictureUrl,
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
          const SizedBox(
            height: 2,
          ),
          Text(
            userModel.username.substring(
              0,
              userModel.username.indexOf(" "),
            ),
            style: AppConstants.body_TextStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.8),
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
