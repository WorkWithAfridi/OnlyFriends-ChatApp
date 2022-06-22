import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/controllers/authenticationController.dart';

import '../controllers & bindings/controllers/homeFrameController.dart';
import '../data/constants/app_constants.dart';
import '../routing/routes.dart';
import '../widgets/appData/appIconTitle.dart';
import 'callHistoryPage.dart';
import 'homePage.dart';
import 'startNewChatPage.dart';

List<Widget> HomeFramePages = [
  HomePage(),
  StartANewChatPage(),
  CallHistoryPage()
];

class HomeFrame extends StatelessWidget {
  HomeFrame({Key? key}) : super(key: key);

  HomeFrameController controller = Get.find();
  AuthenticationController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppIconTitle(),
        backgroundColor: AppConstants.customWhite,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(ROUTES.getProfileScreenRoute);
            },
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppConstants.customWhite,
              backgroundImage: NetworkImage(
                authenticationController.userModel!.profilePictureUrl,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          controller: controller.homeFramePageController.value,
          itemBuilder: (context, index) {
            return HomeFramePages[index];
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppConstants.secondaryColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: AppConstants.customWhite,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 5,
          currentIndex: controller.pageIndex.value,
          onTap: (value) {
            controller.pageIndex.value = value;
            controller.homeFramePageController.value.jumpToPage(
              value,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: controller.pageIndex.value == 0 ? 25 : 20,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: controller.pageIndex.value == 1 ? 25 : 20,
              ),
              label: "Start a new chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                size: controller.pageIndex.value == 2 ? 25 : 20,
              ),

              // Icon(
              //   FontAwesomeIcons.userAstronaut,
              //   size: controller.pageIndex.value == 2 ? 20 : 15,
              // ),
              label: "Call History",
            ),
          ],
        ),
      ),
    );
  }
}
