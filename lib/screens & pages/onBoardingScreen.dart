import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers & bindings/controllers/viewControllers/onBoardingScreenController.dart';
import '../data/constants/app_constants.dart';
import '../widgets/appData/appIconTitle.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppIconTitle(),
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: GetBannerImage(),
            ),
            Flexible(
              flex: 1,
              child: GetBottomSegment(),
            ),
          ],
        ),
      ),
    );
  }
}

class GetBottomSegment extends StatelessWidget {
  GetBottomSegment({
    Key? key,
  }) : super(key: key);

  final OnBoardingScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppConstants.customGradient,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => Text(
                  controller.pageIndex.value == 0
                      ? "Send Unlimited Messages"
                      : controller.pageIndex.value == 1
                          ? "Enjoy Group Chat"
                          : "Sign up NOW!",
                  style: AppConstants.labelMid_TextStyle
                      .copyWith(color: AppConstants.customWhite),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Obx(
                () => Text(
                  controller.pageIndex.value == 0
                      ? "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede."
                      : controller.pageIndex.value == 1
                          ? "Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat."
                          : "Praesent dapibus, neque id cursus faucibus, tortor neque egestas auguae, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.",
                  textAlign: TextAlign.center,
                  style: AppConstants.body_TextStyle.copyWith(
                    color: Colors.white.withOpacity(.7),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        controller.onSkipOrBackButtonPressed();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: Obx(
                          () => Text(
                            controller.pageIndex.value == 0 ? "Skip" : "Back",
                            style: AppConstants.labelMid_TextStyle.copyWith(
                              color: Colors.white.withOpacity(.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: controller.pageIndex.value == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: controller.pageIndex.value == 1
                                  ? Colors.white
                                  : Colors.white.withOpacity(.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: controller.pageIndex.value == 2
                                  ? Colors.white
                                  : Colors.white.withOpacity(.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        controller.pageIndex == 2
                            ? controller.getStarted()
                            : controller.moveToNextPage();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: Obx(
                          () => Text(
                            controller.pageIndex.value == 2
                                ? "Get started"
                                : 'Next',
                            style: AppConstants.labelMid_TextStyle
                                .copyWith(color: AppConstants.customWhite),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class GetBannerImage extends StatelessWidget {
  GetBannerImage({Key? key}) : super(key: key);

  final OnBoardingScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      margin: const EdgeInsets.all(50),
      child: Obx(
        () => SvgPicture.asset(
          controller.pageIndex.value == 0
              ? 'asset/svg/chatting.svg'
              : controller.pageIndex.value == 1
                  ? 'asset/svg/video_call.svg'
                  : 'asset/svg/messaging.svg',
        ),
      ),
    );
  }
}
