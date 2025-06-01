import 'package:flutter/material.dart';

import 'cardbanner.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                CardBanner(
                  image: "https://i.postimg.cc/yY2bNrmd/Image-Banner-2.png",
                  category: "Smartphone",
                  numOfBrands: 108,
                  press: () {},
                ),
                CardBanner(
                  image: "https://i.postimg.cc/BQjz4G1k/Image-Banner-3.png",
                  category: "Fashion",
                  numOfBrands: 24,
                  press: () {},
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
