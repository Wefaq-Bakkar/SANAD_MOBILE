import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/controllers/subcategory_controller.dart';
import '../../../data/models/subcategory_model.dart';
import '../../widget/common/simple_image_card.dart';
import 'package:SANAD_MOBILE/core/functions/functions.dart';

class SubcategoriesPage extends StatelessWidget {
  const SubcategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments;
    final int categoryId = args['categoryId'] ?? args['id'];
    final String categoryName = args['name'] ?? '';
    final subcategoryController = Get.put(SubcategoryController());

    // Fetch subcategories when the page is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (subcategoryController.subcategories.isEmpty && !subcategoryController.isLoading.value) {
        subcategoryController.fetchSubcategoriesByCategory(categoryId);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (subcategoryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (subcategoryController.errorMessage.isNotEmpty) {
          return Center(child: Text(subcategoryController.errorMessage.value));
        }
        final subcategories = subcategoryController.subcategories;
        if (subcategories.isEmpty) {
          return const Center(child: Text('لا توجد نتائج'));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemCount: subcategories.length,
          itemBuilder: (context, index) {
            final SubcategoryModel sub = subcategories[index];
            return SimpleImageCard(
              name: sub.name,
              imageUrl: getFullImageUrl(sub.imageFile?.path),
              onTap: () {
                if (sub.brandsTotal > 0) {
                  Get.toNamed('/brands', arguments: {'subcategoryId': sub.id, 'name': sub.name});
                } else {
                  Get.toNamed('/product-cards', arguments: {'subcategoryId': sub.id, 'name': sub.name});
                }
              },
            );
          },
        );
      }),
    );
  }
}
