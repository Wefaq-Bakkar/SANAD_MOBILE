// lib/presentation/page/root_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/controllers/auth_controller.dart';
import '../../core/constants/route.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wait for the first frame to ensure bindings are ready
    Future.microtask(() {
      final AuthController authController = Get.find<AuthController>();
      if (authController.isLoggedIn) {
        Get.offAllNamed(AppRoute.home);
      } else {
        Get.offAllNamed(AppRoute.login);
      }
    });
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
