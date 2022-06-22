import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:only_friends/controllers%20&%20bindings/bindings/appBindings.dart';
import 'package:only_friends/firebase_options.dart';

import 'data/theme/themeData.dart';
import 'routing/routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  runApp(const OnlyTexts());
}

class OnlyTexts extends StatelessWidget {
  const OnlyTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: ROUTES.routes,
      initialBinding: AppBindings(),
      smartManagement: SmartManagement.onlyBuilder,
      initialRoute: ROUTES.getSplashScreenRoute,
      theme: CustomTheme().lightTheme,
    );
  }
}
