import 'package:flutter/material.dart';

class AppConstants {
  //Colors
  static const Color primaryColor = Color(0xff734DF9);
  static const Color secondaryColor = Color(0xffAE3DF3);
  static const Color customWhite = Color(0xffFAFAFA);
  static const Color facebookBlue = Color(0xff3A5A97);
  static const Color googleRed = Color(0xffE94134);
  static const Color chatBoxUserTwoColor = Color(0xffF1F2F6);
  static Color lightGrey = Colors.grey.withOpacity(.5);
  static Color darkGrey = Colors.grey.withOpacity(.9);

  //Gradient
  static const LinearGradient customGradient = LinearGradient(
    colors: [
      primaryColor,
      secondaryColor,
      primaryColor,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  static const LinearGradient customGradientTwo = LinearGradient(
    colors: [
      primaryColor,
      secondaryColor,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  //Text Styles
  static const TextStyle appTitle_TextStyle = TextStyle(
    fontFamily: "PatrickHandSCRegular",
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle labelMid_TextStyle = TextStyle(
      fontFamily: "PoppinsRegular",
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  static const TextStyle body_TextStyle = TextStyle(
    fontFamily: "PoppinsRegular",
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  //App Data
  static const String appName = "OnlyFriends";

  //Gobal dimentions
  static const EdgeInsets globalPadding = EdgeInsets.symmetric(horizontal: 20);
}
