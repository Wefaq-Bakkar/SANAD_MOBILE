import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/themes/appcolor.dart';
import '../../../domain/controllers/home_controller.dart';
import '../../widget/home/navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.backgroundcolor,
          body: controller.listPage.elementAt(controller.currentPage),
          bottomNavigationBar: const HomeBottomNavigation(),
        );
      },
    );
  }
}
