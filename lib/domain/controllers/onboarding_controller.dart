import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/route.dart';
import '../../core/services/service.dart';
import '../../data/datasources/static/onboarding_data.dart';

abstract class OnBoardingController extends GetxController {
  next();
  previous();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("onboarding", "true");
      Get.offAllNamed(AppRoute.home);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  previous() {
    currentPage--;

    if (currentPage < 0) {
      Get.offAllNamed(AppRoute.home);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
