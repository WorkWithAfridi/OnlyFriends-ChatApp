import 'package:flutter/material.dart';

import '../../data/constants/app_constants.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
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
                        BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Budia Chan Chan'.substring(
              0,
              'Budia Chan Chan'.indexOf(" "),
            ),
            style: AppConstants.body_TextStyle.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.8),
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
