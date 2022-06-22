import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../data/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final Function callBackFunction;
  final String title;
  bool isLoading;
  CustomButton({
    Key? key,
    required this.callBackFunction,
    required this.title,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBackFunction();
      },
      child: Container(
        height: 50,
        width: Get.width,
        padding: isLoading ? const EdgeInsets.all(5) : const EdgeInsets.all(0),
        decoration: BoxDecoration(
          gradient: AppConstants.customGradientTwo,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: AppConstants.customWhite,
                  ),
                ),
              )
            : Text(
                title,
                style: AppConstants.labelMid_TextStyle.copyWith(
                  color: AppConstants.customWhite,
                ),
              ),
      ),
    );
  }
}
