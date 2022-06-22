import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../data/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final Function callBackFunction;
  final String title;
  const CustomButton(
      {Key? key, required this.callBackFunction, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBackFunction();
      },
      child: Container(
        height: 50,
        width: Get.height,
        decoration: BoxDecoration(
          gradient: AppConstants.customGradientTwo,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: AppConstants.labelMid_TextStyle.copyWith(
            color: AppConstants.customWhite,
          ),
        ),
      ),
    );
  }
}
