import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/home/dashboard/header/header.dart';
import '../../widget/home/dashboard/classification/classification.dart';
import '../../widget/home/dashboard/quickaction/quickaction.dart';
import '../../widget/home/dashboard/header/balance_banner.dart';




class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Dashboardheader(
                name: "Wefaq Bakkar ",
              ),
              SizedBox(
                height: 20,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: BalanceBanner(
                          label: "YourBalance".tr,
                          balance: "1000.00",
                          currency: "د.ل",
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: BalanceBanner(
                          label: "ProfitWallet".tr,
                          balance: "400.00",
                          currency: "د.ل",
                          onTap: () {
                            Get.toNamed('/profit');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Divider(
                indent: 30,
                endIndent: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text('MostPopular'.tr),
                  ],
                ),
              ),
              QuickAction(),
              Divider(
                indent: 30,
                endIndent: 30,
              ),
              Classification()
            ],
          ),
        ),
      ),
    );
  }
}
