import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../../widgets/customBackButton.dart';
import '../data/constants/app_constants.dart';
import '../routing/routes.dart';
import '../widgets/appData/appIcon.dart';

class GeneratedReferralCodeScreen extends StatelessWidget {
  const GeneratedReferralCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: AppConstants.globalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Referral Code generated',
              style: AppConstants.appTitle_TextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            const AppIcon(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your referral code is:",
              style: AppConstants.body_TextStyle.copyWith(
                color: Colors.black.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                  ClipboardData(text: 'ToTheMoon122112'),
                );
              },
              child: Container(
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppConstants.primaryColor.withOpacity(.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey.withOpacity(.2),
                    width: .5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'ToTheMoon122112',
                  style: AppConstants.body_TextStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "*Click on the generated link to copy it to clipboard.",
                  style: AppConstants.body_TextStyle.copyWith(
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(ROUTES.getHomeFrameRoute);
              },
              child: Container(
                height: 50,
                width: Get.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppConstants.primaryColor,
                      AppConstants.secondaryColor,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Dismiss",
                  style: AppConstants.labelMid_TextStyle.copyWith(
                    color: AppConstants.customWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
