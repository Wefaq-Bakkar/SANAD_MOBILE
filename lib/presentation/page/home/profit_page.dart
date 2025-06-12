import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfitPage extends StatelessWidget {
  const ProfitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfitWallet'.tr),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ProfitCard(
                  title: 'International'.tr,
                  amount: '250.00 د.ل',
                  icon: Icons.public,
                  color: Colors.black,
                ),
                const SizedBox(width: 20),
                _ProfitCard(
                  title: 'Local'.tr,
                  amount: '150.00 د.ل',
                  icon: Icons.location_city,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.shopping_cart),
                  label: Text('UseProfitToBuyCards'.tr),
                  onPressed: () {
                    // TODO: Implement buy cards action
                  },
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.account_balance_wallet),
                  label: Text('WithdrawProfit'.tr),
                  onPressed: () {
                    // TODO: Implement withdraw action
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'ProfitPageDescription'.tr,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class _ProfitCard extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;
  final Color color;

  const _ProfitCard({
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 150,
        height: 180,
        
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              amount,
              style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

}