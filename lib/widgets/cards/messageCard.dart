
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/constants/app_constants.dart';
import '../../routing/routes.dart';
import '../functionalWidgets/showPopUpContactDetails.dart';
import '../customDivider.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(ROUTES.getChatScreenRoute);
          },
          child: Container(
            height: 50,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showUserDataPopUp();
                    print('clicked');
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1524638431109-93d95c968f03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(
                                    15),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(
                                    2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius
                                        .circular(15),
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Budia Chan",
                        style:
                            AppConstants.labelMid_TextStyle.copyWith(
                          color: AppConstants.primaryColor,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.",
                        style: AppConstants.body_TextStyle.copyWith(
                          color: Colors.black
                              .withOpacity(.75),
                          height: .95,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Text(
                  "12:45 PM",
                  style: AppConstants.labelMid_TextStyle.copyWith(
                    fontSize: 10,
                    color: AppConstants.darkGrey,
                  ),
                ),
              ],
            ),
          ),
        ),
        const CustomDivider(gap: 10),
      ],
    );
  }
}
