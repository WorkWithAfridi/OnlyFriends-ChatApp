import 'package:flutter/material.dart';

import '../data/constants/app_constants.dart';

class CustomCircularProgressLoadingIndicator extends StatelessWidget {
  const CustomCircularProgressLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: AppConstants.customWhite,
        ),
      ),
    );
  }
}
