import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'appIcon.dart';
import 'appTitle.dart';

class AppIconTitle extends StatelessWidget {
  const AppIconTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        AppIcon(),
        SizedBox(
          width: 5,
        ),
        AppTitle()
      ],
    );
  }
}
