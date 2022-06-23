import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers & bindings/controllers/viewControllers/splashScreenController.dart';
import '../widgets/appData/appIconTitle.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final SplashScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.triggerSplashScreeen();
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            AppIconTitle()
          ],
        ),
      ),
    );
  }
}
