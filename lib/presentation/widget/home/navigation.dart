import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/controllers/home_controller.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: BottomNavigationBar(
            currentIndex: controller.currentPage,
            onTap: (index) => controller.changePage(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Main".tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorite".tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "MyOrders".tr,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: "list".tr,
              ),
            ],
          ),
        ),
      );
    });
  }
}