import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class CustomTheme {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppConstants.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppConstants.customWhite,
      centerTitle: true,
      elevation: 0,
    ),
    backgroundColor:AppConstants.customWhite,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppConstants.primaryColor,
      onPrimary: AppConstants.customWhite,
      secondary: AppConstants.secondaryColor,
      onSecondary: AppConstants.customWhite,
      error: Colors.red,
      onError: AppConstants.customWhite,
      background: AppConstants.customWhite,
      onBackground: Colors.black,
      surface: AppConstants.customWhite,
      onSurface: Colors.black,
    ),
  );
}
