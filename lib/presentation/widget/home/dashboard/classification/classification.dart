import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/../../domain/controllers/category_controller.dart';
import '/../../data/models/category_model.dart';
import '/../../presentation/widget/common/simple_image_card.dart';
import 'package:SANAD_MOBILE/core/functions/functions.dart';


class Classification extends StatefulWidget {
  final List<Map<String, String>> classifications;
  const Classification({Key? key, List<Map<String, String>>? classifications})
      : classifications = classifications ?? const [
          {
            'id': '1',
            'image': 'assets/images/classes/giga.png',
            'name': 'كروت الانترنت'
          },
          {
            'id': '2',
            'image': 'assets/images/classes/libyana.jpeg',
            'name': 'كروت دولية '
          },
          {
            'id': '3',
            'image': 'assets/images/classes/madar.png',
            'name': ' كروت النيجر والاتصالات الدولية'
          },
          {
            'id': '4',
            'image': 'assets/images/classes/LTT_logo.svg.png',
            'name': ' الاتصالات المحلية'
          },
          {
            'id': '5',
            'image': 'assets/images/classes/pubg.png',
            'name': ' الكروت المصرية'
          },
          {
            'id': '6',
            'image': 'assets/images/classes/giga.png',
            'name': ' منصات تعليمية'
          },
          {
            'id': '7',
            'image': 'assets/images/classes/libyana.jpeg',
            'name': ' الخدمات المحلية '
          },
          {
            'id': '8',
            'image': 'assets/images/classes/madar.png',
            'name': 'حوالات دولية'
          },
        ],
        super(key: key);

  @override
  State<Classification> createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'التصنيفات'.tr,
             
            ),
          ),
          Obx(() {
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
              shrinkWrap: true, // <-- add this!
              physics: const NeverScrollableScrollPhysics(), // <-- add this!
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
                 imageUrl: getFullImageUrl(cat.fileImage?.path),
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
        ],
// ...existing code...
         ),
    );
  }
}