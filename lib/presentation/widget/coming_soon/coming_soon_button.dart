import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/route.dart';
import '../../../core/themes/appcolor.dart';


class ComingSoonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const ComingSoonButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primarycolor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed ?? () => Get.offAllNamed(AppRoute.home),
        child: Text(
          text,
          style:TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
        ),

      ),
      ),
    );
  }
}
