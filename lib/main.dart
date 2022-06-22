import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/theme/themeData.dart';
import 'routing/routes.dart';

main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const OnlyTexts());
}

class OnlyTexts extends StatelessWidget {
  const OnlyTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: ROUTES.routes,
      smartManagement: SmartManagement.onlyBuilder,
      initialRoute: ROUTES.getSplashScreenRoute,
      theme: CustomTheme().lightTheme,
    );
  }
}
