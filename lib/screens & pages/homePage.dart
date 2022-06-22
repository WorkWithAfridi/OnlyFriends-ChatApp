import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../widgets/cards/messageCard.dart';
import '../../widgets/cards/storyCard.dart';
import '../controllers & bindings/controllers/homeFrameController.dart';
import '../data/constants/app_constants.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeFrameController homeFrameController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "It's quite empty down here. :)\n Maybe add someone and start chatting!!",
                  textAlign: TextAlign.center,
                  style: AppConstants.body_TextStyle.copyWith(
                    color: Colors.black.withOpacity(.7),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeFrameController.pageIndex.value = 1;
                    homeFrameController.homeFramePageController.value
                        .jumpToPage(
                      1,
                    );
                  },
                  child: Text(
                    "Get Started!!",
                    style: AppConstants.body_TextStyle.copyWith(
                        color: AppConstants.secondaryColor.withOpacity(.8),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Active",
                          style: AppConstants.labelMid_TextStyle.copyWith(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "See all",
                          style: AppConstants.body_TextStyle.copyWith(
                            color: AppConstants.darkGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 75,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return StoryCard();
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: AppConstants.globalPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recent Chats",
                          style:AppConstants. labelMid_TextStyle.copyWith(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return MessageCard();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
