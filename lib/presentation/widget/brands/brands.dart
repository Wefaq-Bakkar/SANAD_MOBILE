import 'package:flutter/material.dart';
import 'brand_card.dart';

class Brands extends StatelessWidget {
  final List<Map<String, String>> brands;
  final void Function(String name)? onBrandTap;
  const Brands({super.key, required this.brands, this.onBrandTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: brands.length,
      itemBuilder: (context, index) {
        final brand = brands[index];
        return BrandCard(
          name: brand['name'] ?? '',
          image: brand['image'] ?? '',
          onTap: onBrandTap != null ? () => onBrandTap!(brand['name'] ?? '') : null,
        );
      },
    );
  }
}
