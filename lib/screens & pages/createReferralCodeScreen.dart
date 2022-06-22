import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../../widgets/customBackButton.dart';
import '../data/constants/app_constants.dart';
import '../widgets/appData/appIcon.dart';
import '../widgets/customTextField.dart';
import 'generatedReferralCodeScreen.dart';

class CreateReferralCodeScreen extends StatelessWidget {
  const CreateReferralCodeScreen({Key? key}) : super(key: key);

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
              'Referral Code generator',
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
              "Hi, please input some unique text to have them displayed in your referral link! \n\nPlease do note that one referral code can be used only once!",
              style: AppConstants.body_TextStyle.copyWith(
                color: Colors.black.withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            GetTextField(
              textEditingController: TextEditingController(),
              hintText: "Enter message...",
              textInputType: TextInputType.text,
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Get.off(() => GeneratedReferralCodeScreen());
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
                  "Generate",
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
