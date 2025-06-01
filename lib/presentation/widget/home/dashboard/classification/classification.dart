import 'package:flutter/material.dart';
import 'classification_card.dart';
import 'package:get/get.dart';

class Classification extends StatelessWidget {
  final List<Map<String, String>> classifications;
  // Each map: { 'image': ..., 'title': ..., 'subtitle': ... }
  const Classification({Key? key, List<Map<String, String>>? classifications})
      : classifications = classifications ?? const [
          {
            'id': '1',
            'image': 'assets/images/classes/giga.png',
            'title': 'كروت الانترنت',
            'subtitle': 'شركة 43',
          },
          {
            'id': '2',
            'image': 'assets/images/classes/libyana.jpeg',
            'title': 'كروت دولية ',
            'subtitle': 'شركة 22',
          },
          {
            'id': '3',
            'image': 'assets/images/classes/madar.png',
            'title': ' كروت النيجر والاتصالات الدولية',
            'subtitle': 'شركة 4',
          },
          {
            'id': '4',
            'image': 'assets/images/classes/LTT_logo.svg.png',
            'title': ' الاتصالات المحلية',
            'subtitle': 'شركة 3',
          },
          {
            'id': '5',
            'image': 'assets/images/classes/pubg.png',
            'title': ' الكروت المصرية',
            'subtitle': 'شركة 3',
          },
          {
            'id': '6',
            'image': 'assets/images/classes/giga.png',
            'title': ' منصات تعليمية',
            'subtitle': 'شركة 4',
          },
          {
            'id': '7',
            'image': 'assets/images/classes/libyana.jpeg',
            'title': ' الخدمات المحلية ',
            'subtitle': 'شركة 5',
          },
          {
            'id': '8',
            'image': 'assets/images/classes/madar.png',
            'title': 'حوالات دولية',
            'subtitle': 'شركة 1',
          },
        ],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Classifications'.tr,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: classifications.length,
            itemBuilder: (context, index) {
              final item = classifications[index];
              return ClassificationCard(
                imageUrl: item['image'] ?? '',
                title: item['title'] ?? '',
                subtitle: item['subtitle'] ?? '',
                onTap: () {
                  Get.toNamed('/brands', arguments: item);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
