import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/themes/appcolor.dart';
import '../../domain/controllers/onboarding_controller.dart';
import '../widget/onboarding/button.dart';
import '../widget/onboarding/slider.dart';
import '../widget/onboarding/smoothdotcontroller.dart';

class OnBoardingPage extends GetView<OnBoardingControllerImp> {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
          child: Column(children: [
            SizedBox(height: 40),
            Expanded(
              flex: 3,
              child: OnboardingSlider(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    OnboardingSmoothDotController(),
                    Spacer(flex: 2),
                    OnboardingButton()
                  ],
                ))
          ]),
        ));
  }
}
