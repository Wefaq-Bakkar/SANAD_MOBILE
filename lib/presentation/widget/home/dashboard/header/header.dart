import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/iconasset.dart';
import 'notificationicon.dart';

class Dashboardheader extends StatelessWidget {
  final String name;

  const Dashboardheader({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "DashboardHeader".tr,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(text: name),
              ],
            ),
          )),
          const SizedBox(width: 16),
          IconBtnWithCounter(
            svgSrc: AppsIconAsset.bellIcon,
            numOfitem: 6,
            press: () {},
          ),
          const SizedBox(width: 16),
          IconBtnWithCounter(
            // numOfitem: 3,
             svgSrc: AppsIconAsset.cartIcon,
            press: () {},
          ),
        ],
      ),
    );
  }
}
