import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/statusrequest.dart';

handlingResponse(statusRequest) {
  switch (statusRequest) {
    case StatusRequest.offlinefailure:
      Get.snackbar(
        "Warning".tr,
        "offlinefailure".tr,
        colorText: Colors.white,
        backgroundColor: Colors.red[400],
        icon: const Icon(Icons.add_alert),
        duration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
      );
      break;
    case StatusRequest.serverfailure:
      Get.snackbar(
        "Warning".tr,
        "serverfailure".tr,
        colorText: Colors.white,
        backgroundColor: Colors.red[400],
        icon: const Icon(Icons.add_alert),
        duration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
      );
      break;
    case StatusRequest.failure:
      Get.snackbar(
        "Warning".tr,
        "failure".tr,
        colorText: Colors.white,
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.add_alert),
        duration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
      );
      break;

    default:
      Get.snackbar(
        "Warning".tr,
        "serverfailure".tr,
        colorText: Colors.white,
        backgroundColor: Colors.red[400],
        icon: const Icon(Icons.add_alert),
        duration: const Duration(seconds: 1),
        snackPosition: SnackPosition.BOTTOM,
      );
  }
}
