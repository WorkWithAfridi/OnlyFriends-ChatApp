import 'package:flutter/material.dart';

import '../data/constants/app_constants.dart';

class GetTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final int maxLines;

  const GetTextField(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType,
      required this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      style: AppConstants.body_TextStyle.copyWith(
        color: Colors.black.withOpacity(.8),
      ),
      textInputAction: TextInputAction.next,
      cursorColor: AppConstants.primaryColor,
      controller: textEditingController,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppConstants.body_TextStyle.copyWith(
          color: Colors.black.withOpacity(.5),
        ),
        border: inputBorder,
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            context,
            color: AppConstants.secondaryColor,
            width: 1,
          ),
        ),
        enabledBorder: inputBorder,
        fillColor: AppConstants.primaryColor.withOpacity(.05),
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
