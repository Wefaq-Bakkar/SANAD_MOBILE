import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'core/localizations/translation.dart';
import 'core/localizations/changelocal.dart';
import 'core/services/service.dart';
import 'presentation/bindings/intialbindings.dart';
import 'route/routes.dart';
import 'domain/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final LocaleController controller = Get.put(LocaleController());
    // Decide initial route based on login status
    String initialRoute = authController.isLoggedIn ? '/home' : '/login';
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Sanad App',
      theme: controller.appTheme,
      getPages: routes,
      initialBinding: InitialBindings(),
      initialRoute: initialRoute,
    );
  }
}
