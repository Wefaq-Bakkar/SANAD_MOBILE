import 'package:get/get.dart';

import '../../core/services/service.dart';

class AuthController extends GetxController {
  final MyServices myServices = Get.find();

  bool get isLoggedIn => myServices.sharedPreferences.getString('token') != null;
}
