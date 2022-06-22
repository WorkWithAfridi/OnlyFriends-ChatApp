import 'package:flutter/material.dart';
import '../../data/constants/app_constants.dart';
import '../functionalWidgets/showPopUpContactDetails.dart';
import '../customDivider.dart';

class CallHistoryCard extends StatelessWidget {
  const CallHistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showUserDataPopUp();
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1524638431109-93d95c968f03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Budia Chan",
                      style: AppConstants.labelMid_TextStyle.copyWith(
                        color: AppConstants.primaryColor.withOpacity(.8),
                        fontSize: 12,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      '8 minutes ago',
                      style: AppConstants.labelMid_TextStyle.copyWith(
                        color: Colors.black.withOpacity(
                          .4,
                        ),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.call,
                    size: 20,
                    color: AppConstants.secondaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.video_call,
                    size: 25,
                    color: AppConstants.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const CustomDivider(gap: 8),
      ],
    );
  }
}
