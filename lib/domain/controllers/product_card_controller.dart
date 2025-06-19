// lib/domain/controllers/product_card_controller.dart
import 'dart:convert';
import 'package:get/get.dart';
import '../../data/datasources/remote/product_card_api.dart';
import '../../data/models/product_card_model.dart';

class ProductCardController extends GetxController {
  RxList<ProductCardModel> productCards = <ProductCardModel>[].obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchProductCards({int? brandId, int? categoryId, int? subcategoryId, int? page, int? limit}) async {
    isLoading.value = true;
    errorMessage.value = '';
    final response = await ProductCardApi.getProductCards(
      brandId: brandId,
      categoryId: categoryId,
      subcategoryId: subcategoryId,
      page: page,
      limit: limit,
    );
    final data = jsonDecode(response.body);
    isLoading.value = false;
    if (data['success'] == true) {
      productCards.value = (data['data'] as List)
          .map((e) => ProductCardModel.fromJson(e))
          .toList();
      if (data['message'] != null) {
        // Print the message in the terminal
        // ignore: avoid_print
        print('PRODUCT CARD API MESSAGE: ${data['message']}');
      }
    } else {
      errorMessage.value = data['message'] ?? 'Failed to fetch product cards';
      print('PRODUCT CARD API ERROR: ${errorMessage.value}');
    }
  }
}
