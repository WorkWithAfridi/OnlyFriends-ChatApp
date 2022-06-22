import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../data/constants/app_constants.dart';

class CustomDivider extends StatelessWidget {
  final int gap;
  const CustomDivider({
    Key? key,
    required this.gap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: gap.toDouble(),
        ),
        Container(
          height: .5,
          width: Get.width,
          color: AppConstants.lightGrey.withOpacity(.15),
        ),
        SizedBox(
          height: gap.toDouble(),
        ),
      ],
    );
  }
}
