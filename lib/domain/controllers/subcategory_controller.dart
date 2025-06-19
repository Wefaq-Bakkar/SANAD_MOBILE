
import 'dart:convert';
import 'package:get/get.dart';
import '../../data/datasources/remote/subcategory_api.dart';
import '../../data/models/subcategory_model.dart';

class SubcategoryController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Do not call fetchSubcategoriesByCategory here unless you have a categoryId!
  }
  RxList<SubcategoryModel> subcategories = <SubcategoryModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchSubcategoriesByCategory(int categoryId) async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await SubcategoryApi.getSubcategoriesByCategory(categoryId);
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      subcategories.value = (data['data'] as List)
          .map((e) => SubcategoryModel.fromJson(e))
          .toList();
      if (data['message'] != null) {
        // Print the message in the terminal
        // ignore: avoid_print
        print('SUBCATEGORY API MESSAGE: ${data['message']}');
      }
    } else {
      errorMessage.value = data['message'] ?? 'Failed to fetch subcategories';
      print('SUBCATEGORY API ERROR: ${errorMessage.value}');
    }
  }
}
