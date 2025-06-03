import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BalanceBanner extends StatelessWidget {
  final String balance;
  final String currency;
  final String localProfit;
  final String internationalProfit;
  const BalanceBanner({
    Key? key,
    this.balance = '0.00',
    this.currency = 'LYD',
    this.localProfit = '0.00',
    this.internationalProfit = '0.00',
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
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "YourBalance".tr,
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
          const SizedBox(height: 10),
          Text(
            "ProfitWallet".tr,
            style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${'Local'.tr}: $localProfit",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Text(
                  "${'International'.tr}: $internationalProfit",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
