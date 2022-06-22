import 'package:flutter/material.dart';
import '../../data/constants/app_constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppConstants.appName,
      style: AppConstants.appTitle_TextStyle,
    );
  }
}
