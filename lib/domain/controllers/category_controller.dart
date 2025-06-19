// lib/domain/controllers/category_controller.dart
import 'dart:convert';
import 'package:get/get.dart';
import '../../data/datasources/remote/category_api.dart';
import '../../data/models/category_model.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchCategories() async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await CategoryApi.getCategories();
    print('CATEGORY API RAW RESPONSE: ' + response.body.toString()); // Debug print
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      categories.value = (data['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      if (data['message'] != null) {
        // Print the message in the terminal
        // ignore: avoid_print
        print('CATEGORY API MESSAGE: ${data['message']}');
      }
    } else {
      errorMessage.value = data['message'] ?? 'Failed to fetch categories';
      print('CATEGORY API ERROR: ${errorMessage.value}');
    }
  }
}
