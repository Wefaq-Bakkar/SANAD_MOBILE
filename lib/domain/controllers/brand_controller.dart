
// lib/domain/controllers/brand_controller.dart
import 'dart:convert';
import 'package:get/get.dart';
import '../../data/datasources/remote/brand_api.dart';
import '../../data/models/brand_model.dart';

class BrandController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Do not call fetchBrandsByCategory here unless you have a categoryId or subcategoryId!
  }
  RxList<BrandModel> brands = <BrandModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchBrandsByCategory(int categoryId) async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await BrandApi.getBrandsByCategory(categoryId);
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      brands.value = (data['data'] as List)
          .map((e) => BrandModel.fromJson(e))
          .toList();
      if (data['message'] != null) {
        // Print the message in the terminal
        // ignore: avoid_print
        print('BRAND API MESSAGE: ${data['message']}');
      }
    } else {
      errorMessage.value = data['message'] ?? 'Failed to fetch brands';
      print('BRAND API ERROR: ${errorMessage.value}');
    }
  }

  Future<void> fetchBrandsBySubcategory(int subcategoryId) async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await BrandApi.getBrandsBySubcategory(subcategoryId);
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      brands.value = (data['data'] as List)
          .map((e) => BrandModel.fromJson(e))
          .toList();
      if (data['message'] != null) {
        // Print the message in the terminal
        // ignore: avoid_print
        print('BRAND API MESSAGE: ${data['message']}');
      }
    } else {
      errorMessage.value = data['message'] ?? 'Failed to fetch brands';
      print('BRAND API ERROR: ${errorMessage.value}');
    }
  }
}
