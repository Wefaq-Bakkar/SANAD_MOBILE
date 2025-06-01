import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/service.dart';
import '../themes/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeArabic;

  changelang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    myServices.sharedPreferences.setString("setlang", "true");

    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      // Default to Arabic if no language is set
      language = const Locale("ar");
      appTheme = themeArabic;
    }
    super.onInit();
  }
}
