import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/bindings/signupScreenBinding.dart';
import 'package:only_friends/screens%20&%20pages/signupScreen.dart';

import '../controllers & bindings/bindings/chatScreenBinding.dart';
import '../controllers & bindings/bindings/homeFrameBinding.dart';
import '../controllers & bindings/bindings/onBoardingScreenBinding.dart';
import '../controllers & bindings/bindings/profileScreenBinding.dart';
import '../controllers & bindings/bindings/signinScreenBinding.dart';
import '../controllers & bindings/bindings/splashScreenBinding.dart';
import '../screens & pages/chatScreen.dart';
import '../screens & pages/homeFrame.dart';
import '../screens & pages/onBoardingScreen.dart';
import '../screens & pages/profileScreen.dart';
import '../screens & pages/signinScreen.dart';
import '../screens & pages/splashScreen.dart';

class ROUTES {
  static String get getSplashScreenRoute => "/splashScreen";
  static String get getOnBoardingScreenRoute => "/onboardingScreen";
  static String get getSigninScreenRoute => "/signinScreen";
  static String get getSignupScreenRoute => "/signupScreen";
  static String get getForgotPasswordScreenRoute => "/ForgotPasswordScreen";
  static String get getOtpScreenRoute => "/OtpScreen";
  static String get getHomeFrameRoute => "/HomeFrame";
  static String get getProfileScreenRoute => '/Profile';
  static String get getChatScreenRoute => "/ChatScreen";

  static List<GetPage> routes = [
    GetPage(
      name: getSplashScreenRoute,
      page: () => SplashScreen(),
      binding: SplashScreenBindings(),
    ),
    GetPage(
      name: getOnBoardingScreenRoute,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingScreenBinding(),
    ),
    GetPage(
      name: getSigninScreenRoute,
      page: () => SigninScreen(),
      binding: SigninScreenBinding(),
    ),
    GetPage(
      name: getSignupScreenRoute,
      page: () => SignupScreen(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: getHomeFrameRoute,
      page: () => HomeFrame(),
      binding: HomeFrameBinding(),
    ),
    GetPage(
      name: getProfileScreenRoute,
      page: () => ProfileScreen(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: getChatScreenRoute,
      page: () => ChatScreen(),
      binding: ChatScreenBinding(),
    )
  ];
}
