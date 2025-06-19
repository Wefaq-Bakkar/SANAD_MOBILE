import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SANAD_MOBILE/domain/controllers/product_card_controller.dart';
import 'package:SANAD_MOBILE/data/models/product_card_model.dart';
import 'package:SANAD_MOBILE/presentation/widget/product_card/product_card_widget.dart';
import 'package:SANAD_MOBILE/core/functions/functions.dart';

class ProductCardListPage extends StatelessWidget {
  const ProductCardListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final int? brandId = args?['brandId'];
    final int? categoryId = args?['categoryId'];
    final int? subcategoryId = args?['subcategoryId'];
    final String title = args?['name'] ?? 'Products';

    final productCardController = Get.put(ProductCardController());

    // Fetch product cards when the page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (productCardController.productCards.isEmpty && !productCardController.isLoading.value) {
        productCardController.fetchProductCards(
          brandId: brandId,
          categoryId: categoryId,
          subcategoryId: subcategoryId,
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (productCardController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (productCardController.errorMessage.isNotEmpty) {
          return Center(child: Text(productCardController.errorMessage.value));
        }
        final cards = productCardController.productCards;
        if (cards.isEmpty) {
          return const Center(child: Text('لا توجد نتائج'));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Only 2 cards per row
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.55, // Make cards even taller (longer)
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final ProductCardModel card = cards[index];
            // Debug print to verify card data
            print('ProductCard: name=${card.name}, brandLogoFile=${card.brand.logoFile}');
            String? imageUrl = '';
            if (card.brand.logoFile != null && card.brand.logoFile is Map && card.brand.logoFile['path'] != null) {
              imageUrl = getFullImageUrl(card.brand.logoFile['path']);
            }
            return ProductCardWidget(
              name: card.name,
              imageUrl: imageUrl,
              price: card.price.toString(),
              onPress: () {
                Get.toNamed('/product-details', arguments: card);
              },
              onFavorite: () {
                // TODO: Implement favorite action
              },
              onAddToCart: () {
                // TODO: Implement add to cart action
              },
            );
          },
        );
      }),
    );
  }
}
