import 'package:flutter/material.dart';

import 'actioncard.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"image": "assets/images/classes/giga.png", "text": "قيقا"},
      {"image": "assets/images/classes/libyana.jpeg", "text": "ليبيانا"},
      {"image": "assets/images/classes/madar.png", "text": "المدار"},
      {"image": "assets/images/classes/LTT.png", "text": " ليبيا للاتصالات والتقنية"},
      {"image": "assets/images/classes/pubg.png", "text": " بيبجي"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => ActionCard(
            image: categories[index]["image"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}
