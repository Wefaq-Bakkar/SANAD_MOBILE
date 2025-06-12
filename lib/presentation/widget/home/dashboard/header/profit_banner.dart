// lib/presentation/widget/home/dashboard/header/profit_banner.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfitBanner extends StatelessWidget {
  final String localProfit;
  final String internationalProfit;
  const ProfitBanner({
    Key? key,
    this.localProfit = '0.00',
    this.internationalProfit = '0.00',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "ProfitWallet".tr,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Local'.tr, style: const TextStyle(color: Colors.white54)),
                    Text(
                      localProfit,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('International'.tr, style: const TextStyle(color: Colors.white54)),
                    Text(
                      internationalProfit,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
