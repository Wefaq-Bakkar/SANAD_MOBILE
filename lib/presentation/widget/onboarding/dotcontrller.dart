import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/themes/appcolor.dart';
import '../../../data/datasources/static/onboarding_data.dart';
import '../../../domain/controllers/onboarding_controller.dart';

class OnboardingDotController extends StatelessWidget {
  const OnboardingDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 8),
                          duration: const Duration(milliseconds: 10),
                          width: controller.currentPage == index ? 25 : 10,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primarycolor,
                              borderRadius: BorderRadius.circular(20)),
                        ))
              ],
            ));
  }
}
