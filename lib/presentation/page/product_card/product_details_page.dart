import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // Uncomment if you use SVG icons
import 'package:SANAD_MOBILE/data/models/product_card_model.dart';
import 'package:SANAD_MOBILE/core/functions/functions.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductCardModel product = Get.arguments as ProductCardModel;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          _ProductImages(
            imageUrl: product.brand.logoFile != null &&
                    product.brand.logoFile is Map &&
                    product.brand.logoFile['path'] != null
                ? getFullImageUrl(product.brand.logoFile['path'])
                : null,
          ),
          _TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                _ProductDescription(
                  name: product.name,
                  description: product.description,
                  price: product.price.toString(),
                ),
                _TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: const SizedBox(height: 24),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              onPressed: () {},
              child: Text('AddToCart'.tr),
            ),
          ),
        ),
      ),
    );
  }
}

class _TopRoundedContainer extends StatelessWidget {
  const _TopRoundedContainer({Key? key, required this.color, required this.child}) : super(key: key);
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}

class _ProductImages extends StatelessWidget {
  final String? imageUrl;
  const _ProductImages({Key? key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: imageUrl != null && imageUrl!.isNotEmpty
                ? (imageUrl!.startsWith('assets/')
                    ? Image.asset(imageUrl!, fit: BoxFit.contain)
                    : Image.network(
                        imageUrl!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.image, color: Colors.grey),
                        ),
                      ))
                : Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, color: Colors.grey),
                  ),
          ),
        ),
      ],
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  const _ProductDescription({Key? key, required this.name, required this.description, required this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            description,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            price,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ],
    );
  }
}
