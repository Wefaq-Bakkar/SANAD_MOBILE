import 'package:get/get.dart';
import '../../core/classes/crud.dart';
import '../../domain/controllers/auth_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}