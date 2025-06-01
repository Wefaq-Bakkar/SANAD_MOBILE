import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/imageasset.dart';
import '../../core/constants/route.dart';
import '../../core/localizations/changelocal.dart';
import '../../core/themes/appcolor.dart';
import '../../core/themes/appstyle.dart';
import '../widget/language/button.dart';

class LanguagePage extends GetView<LocaleController> {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LanguageHead".tr,
              style: AppStyle.head,
            ),
            const SizedBox(height: 20),
            Image.asset(
              AppsImageAsset.appLogo,
              width: 230,
              height: 230,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            Text(
              "LanguageTitle".tr,
              style: AppStyle.title,
            ),
            const SizedBox(height: 20),
            LanguageButton(
                textbutton: "عربي",
                onPressed: () {
                  controller.changelang("ar");
                  Get.offNamed(AppRoute.onBoarding);
                }),
            LanguageButton(
                textbutton: "English",
                onPressed: () {
                  controller.changelang("en");
                  Get.offNamed(AppRoute.onBoarding);
                }),
          ],
        ),
      ),
    );
  }
}
