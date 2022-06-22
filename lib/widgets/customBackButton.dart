import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../data/constants/app_constants.dart';

CustomBackButton() {
  return IconButton(
    onPressed: () {
      Get.back();
    },
    icon: const Icon(
      FontAwesomeIcons.arrowLeft,
      size: 15,
      color: AppConstants.primaryColor,
    ),
  );
}
