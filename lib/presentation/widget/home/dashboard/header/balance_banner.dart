import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BalanceBanner extends StatelessWidget {
  final String balance;
  final String currency;
  final String? label;
  final VoidCallback? onTap;
  const BalanceBanner({
    Key? key,
    this.balance = '0.00',
    this.currency = 'LYD',
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? "YourBalance".tr,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "$balance $currency",
              style: const TextStyle(
                color: Colors.white,
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
