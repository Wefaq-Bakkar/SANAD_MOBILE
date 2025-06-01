import 'package:SANAD_MOBILE/presentation/page/home/empty_page.dart';
import 'package:SANAD_MOBILE/presentation/page/home/favorite_page.dart';
import 'package:SANAD_MOBILE/presentation/page/home/list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/services/service.dart';
import '../../presentation/page/home/dashboard_page.dart';


abstract class HomeController extends GetxController {
  changePage(int index);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  int currentPage = 0;

  List<Widget> listPage = [
    DashboardPage(),
    FavoritePage(),
    EmptyPage(),
    ListPage(),
  ];

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}
