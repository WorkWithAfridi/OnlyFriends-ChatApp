import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class AppIcon extends StatelessWidget {
  const AppIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: LottieBuilder.asset(
        'asset/lottie/app_icon.json',
        repeat: false,
      ),
    );
  }
}
