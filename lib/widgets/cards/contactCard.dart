import 'package:flutter/material.dart';

import '../../data/constants/app_constants.dart';
import '../functionalWidgets/showPopUpContactDetails.dart';
import '../customDivider.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
              Text(
                "Budia Chan",
                style: AppConstants.labelMid_TextStyle.copyWith(
                  color: Colors.black.withOpacity(.8),
                  fontSize: 12,
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
