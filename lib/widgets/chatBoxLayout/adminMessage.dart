import 'package:flutter/material.dart';
import 'package:only_friends/data/constants/app_constants.dart';

class AdminMessage extends StatelessWidget {
  final String message;
  const AdminMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15, top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppConstants.chatBoxUserTwoColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            message,
            style: AppConstants.body_TextStyle,
          ),
        ),
      ],
    );
  }
}
