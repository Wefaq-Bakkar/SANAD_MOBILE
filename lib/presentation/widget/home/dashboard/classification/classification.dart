import 'package:flutter/material.dart';
import 'classification_card.dart';
import 'package:get/get.dart';

class Classification extends StatefulWidget {
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
  State<Classification> createState() => _ClassificationState();
}

class _ClassificationState extends State<Classification> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Classifications'.tr,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(isGrid ? Icons.list : Icons.grid_view_rounded),
                tooltip: isGrid ? 'Show as list' : 'Show as grid',
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          isGrid
              ? SizedBox(
                  height: ((widget.classifications.length / 2).ceil() * 110) + 12, // Increased per-row height
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.classifications.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4, // Lower aspect ratio for taller items
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      final item = widget.classifications[index];
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
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.classifications.length,
                  itemBuilder: (context, index) {
                    final item = widget.classifications[index];
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
