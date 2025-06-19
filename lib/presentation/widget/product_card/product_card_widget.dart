
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// If you use SVG icons, uncomment the next line and add flutter_svg to pubspec.yaml
// import 'package:flutter_svg/flutter_svg.dart';

class ProductCardWidget extends StatelessWidget {

  final String name;
  final String? imageUrl;
  final double width;
  final double aspectRatio;
  final String? price;
  final bool isFavourite;
  final VoidCallback? onPress;
  final VoidCallback? onFavorite;
  final VoidCallback? onAddToCart;

  const ProductCardWidget({
    Key? key,
    required this.name,
    this.imageUrl,
    this.width = 140,
    this.aspectRatio = 1.02,
    this.price,
    this.isFavourite = false,
    this.onPress,
    this.onFavorite,
    this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF979797).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
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
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        price != null ? price! : '',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFF7643),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart),
                      tooltip: 'Add to Cart',
                      onPressed: onAddToCart,
                      color: const Color(0xFF979797),
                      iconSize: 20,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: onFavorite,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: isFavourite
                              ? const Color(0xFFFF7643).withOpacity(0.15)
                              : const Color(0xFF979797).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: isFavourite ? const Color(0xFFFF4848) : const Color(0xFFDBDEE4),
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPress,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    child: Text(
                      'View'.tr,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
