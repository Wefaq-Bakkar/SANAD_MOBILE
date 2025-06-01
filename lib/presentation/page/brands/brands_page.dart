import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/brands/brands.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final classification = Get.arguments;
    // Demo: only first classification (id = '1') has brands
    final String? classificationId = classification is Map && classification.containsKey('id')
        ? classification['id']
        : null;

    final List<Map<String, String>> brandsData = [
      {
        'classificationId': '1',
        'name': 'اكسجين ',
        'image': 'assets/images/brands/images-2.jpeg',
      },
      {
        'classificationId': '1',
        'name': 'كونكت ',
        'image': 'assets/images/brands/images-3.png',
      },
      {
        'classificationId': '1',
        'name': 'الريادة ',
        'image': 'assets/images/brands/images-4.png',
      },
    ];

    final filteredBrands = brandsData.where((b) => b['classificationId'] == classificationId).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(classification['title'] ?? 'Brands'.tr),
        backgroundColor: Colors.white,
      ),
      body: filteredBrands.isEmpty
          ? const Center(child: Text('لا توجد نتائج'))
          : Brands(brands: filteredBrands),
    );
  }
}