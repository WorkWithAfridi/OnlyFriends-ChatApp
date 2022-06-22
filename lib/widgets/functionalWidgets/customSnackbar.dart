import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar({
  required String title,
  required String message,
  bool isError = false,
}) {
  Get.snackbar(
    title,
    message,
    icon: isError
        ? const Icon(
            Icons.error,
            color: Colors.red,
          )
        : const Icon(
            Icons.notifications,
            color: Colors.black,
          ),
    // titleText: Text(
    //   title,
    //   style: labelMid_TextStyle.copyWith(
    //     color: Colors.white,
    //     fontSize: 20,
    //     height: 1.5,
    //   ),
    // ),
    // messageText: Text(
    //   message,
    //   style: body_TextStyle.copyWith(
    //     color: Colors.white,
    //   ),
    // ),
    margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
    // backgroundColor: Colors.red,
    duration: const Duration(seconds: 5),
    dismissDirection: DismissDirection.horizontal,
  );
}
