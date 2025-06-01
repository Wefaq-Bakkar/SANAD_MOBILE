import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/themes/appcolor.dart';
import '../../../data/datasources/static/onboarding_data.dart';
import '../../../domain/controllers/onboarding_controller.dart';

class OnboardingSmoothDotController extends GetView<OnBoardingControllerImp> {
  const OnboardingSmoothDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller.pageController,
      count: onBoardingList.length,
      axisDirection: Axis.horizontal,
      effect: const WormEffect(
          spacing: 10.0,
          radius: 25.0,
          dotWidth: 40.0,
          dotHeight: 8.0,
          paintStyle: PaintingStyle.fill,
          dotColor: Colors.grey,
          activeDotColor: AppColor.primarycolor),
    );
  }
}
