import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/appstyle.dart';
import '../../../domain/controllers/onboarding_controller.dart';

class OnboardingTitle extends GetView<OnBoardingControllerImp> {
  final String title;

  const OnboardingTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyle.title,
    );
  }
}
