import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalanceBanner extends StatelessWidget {
  final String balance;
  final String currency;
  const BalanceBanner({
    Key? key,
    this.balance = '0.00',
    this.currency = 'LYD',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color:  Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "YourBalance".tr + "\n"),
            TextSpan(
              text: "$balance $currency",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
