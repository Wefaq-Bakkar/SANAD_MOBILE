import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/route.dart';
import '../services/service.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // If onboarding is done, check login
    if (myServices.sharedPreferences.getString("onboarding") == "true") {
      // Check if user is logged in
      final isLoggedIn = myServices.sharedPreferences.getString("token") != null;
      if (!isLoggedIn && route != AppRoute.login) {
        return const RouteSettings(name: AppRoute.login);
      }
      if (isLoggedIn && route == AppRoute.login) {
        return const RouteSettings(name: AppRoute.home);
      }
      return null;
    }
    // if (myServices.sharedPreferences.getString("setlang") == "true") {
    //   return const RouteSettings(name: AppRoute.onBoarding);
    // }
    return super.redirect(route);
  }
}
