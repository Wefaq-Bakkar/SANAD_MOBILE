import 'package:flutter/material.dart';
import '../../widget/home/favorite/product_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Favorite", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            itemCount: demoProducts.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => ProductCard(
              product: demoProducts[index],
              onPress: () {},
            ),
          ),
        ),
      ),
    );
  }
}


class Product {
  final String image;
  final String text;
  final double price;
  final bool isFavourite;
  Product({required this.image, required this.text, required this.price, this.isFavourite = true});
}

List<Product> demoProducts = [
  Product(image: "assets/images/classes/giga.png", text: "قيقا", price: 64.99),
  Product(image: "assets/images/classes/libyana.jpeg", text: "ليبيانا", price: 50.5),
  Product(image: "assets/images/classes/madar.png", text: "المدار", price: 36.55),
  Product(image: "assets/images/classes/LTT.png", text: "ليبيا للاتصالات والتقنية", price: 42.00),
  Product(image: "assets/images/classes/pubg.png", text: "بيبجي", price: 25.00),
];
