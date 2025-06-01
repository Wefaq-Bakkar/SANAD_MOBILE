import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/appcolor.dart';
import '../../../core/themes/appstyle.dart';
import '../../../domain/controllers/onboarding_controller.dart';

class OnboardingButton extends GetView<OnBoardingControllerImp> {
  const OnboardingButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
          textColor: Colors.white,
          onPressed: () {
            controller.next();
          },
          color: AppColor.primarycolor,
          child: Text(
            "OnboardingButton".tr,
            style: AppStyle.button,
          )),
    );
  }
}
