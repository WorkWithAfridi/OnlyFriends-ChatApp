import 'package:get/get.dart';
import 'package:only_friends/controllers%20&%20bindings/bindings/viewBindings/addAContractScreenBindings.dart';
import 'package:only_friends/screens%20&%20pages/addAContactScreen.dart';
import 'package:only_friends/screens%20&%20pages/signupScreen.dart';

import '../controllers & bindings/bindings/viewBindings/chatScreenBinding.dart';
import '../controllers & bindings/bindings/viewBindings/homeFrameBinding.dart';
import '../controllers & bindings/bindings/viewBindings/onBoardingScreenBinding.dart';
import '../controllers & bindings/bindings/viewBindings/profileScreenBinding.dart';
import '../controllers & bindings/bindings/viewBindings/signinScreenBinding.dart';
import '../controllers & bindings/bindings/viewBindings/signupScreenBinding.dart';
import '../controllers & bindings/bindings/viewBindings/splashScreenBinding.dart';
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
  static String get getProfileScreenRoute => '/ProfileScreen';
  static String get getChatScreenRoute => "/ChatScreen";
  static String get getAddAContractScreenRoute => "/AddAContractScreen";

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
    ),
    GetPage(
      name: getAddAContractScreenRoute,
      page: () => AddAContactScreen(),
      binding: AddAContractScreenBindings(),
    )
  ];
}
