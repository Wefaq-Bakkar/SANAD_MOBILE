import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/brands/brands.dart';
import '../../../domain/controllers/brand_controller.dart';
import 'package:SANAD_MOBILE/core/functions/functions.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final int? categoryId = args != null && args.containsKey('categoryId') ? args['categoryId'] : null;
    final int? subcategoryId = args != null && args.containsKey('subcategoryId') ? args['subcategoryId'] : null;
    final String name = args != null && args['name'] != null ? args['name'] : 'Brands'.tr;
    final brandController = Get.put(BrandController());

    // Fetch brands when the page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (brandController.brands.isEmpty && !brandController.isLoading.value) {
        if (subcategoryId != null) {
          brandController.fetchBrandsBySubcategory(subcategoryId);
        } else if (categoryId != null) {
          brandController.fetchBrandsByCategory(categoryId);
        }
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (brandController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (brandController.errorMessage.isNotEmpty) {
          return Center(child: Text(brandController.errorMessage.value));
        }
        final brands = brandController.brands;
        if (brands.isEmpty) {
          return const Center(child: Text('لا توجد نتائج'));
        }
        return Brands(
          brands: brands.map((b) => {
            'id': b.id.toString(),
            'name': b.name,
            'image':getFullImageUrl(b.logoFile?.path?? ''),
          }).toList(),
          onBrandTap: (brandName) {
            final brand = brands.firstWhere((b) => b.name == brandName);
            Get.toNamed('/product-cards', arguments: {'brandId': brand.id, 'name': brand.name});
          },
        );
      }),
    );
  }
}