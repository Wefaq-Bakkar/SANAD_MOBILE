import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/controllers/category_controller.dart';
import '../../../data/models/category_model.dart';
import '../../widget/common/simple_image_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text('التصنيفات'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (categoryController.errorMessage.isNotEmpty) {
          return Center(child: Text(categoryController.errorMessage.value));
        }
        final categories = categoryController.categories;
        if (categories.isEmpty) {
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
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final CategoryModel cat = categories[index];
            return SimpleImageCard(
              name: cat.name,
              imageUrl: cat.fileImage?.path,
              onTap: () {
                if (cat.subcategoriesTotal > 0) {
                  Get.toNamed('/subcategories', arguments: {'categoryId': cat.id, 'name': cat.name});
                } else {
                  Get.toNamed('/brands', arguments: {'categoryId': cat.id, 'name': cat.name});
                }
              },
            );
          },
        );
      }),
    );
  }
}
