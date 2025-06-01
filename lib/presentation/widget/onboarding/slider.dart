import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/appstyle.dart';
import '../../../data/datasources/static/onboarding_data.dart';
import '../../../domain/controllers/onboarding_controller.dart';

class OnboardingSlider extends GetView<OnBoardingControllerImp> {
  const OnboardingSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  onBoardingList[i].title!,
                  style: AppStyle.title,
                ),
                const SizedBox(height: 50),
                Image.asset(
                  onBoardingList[i].image!,
                  width: 230,
                  height: 230,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 50),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Text(
                      onBoardingList[i].body!,
                      style: AppStyle.body,
                      textAlign: TextAlign.center,
                    )),
              ],
            ));
  }
}
