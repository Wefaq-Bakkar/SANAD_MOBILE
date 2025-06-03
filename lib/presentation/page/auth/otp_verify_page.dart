import 'package:flutter/material.dart';
import '../../widget/auth/otp_verify_form.dart';
import 'package:get/get.dart';

class OtpVerifyPage extends StatelessWidget {
  const OtpVerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phone = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('EnterOTP'.tr),
        backgroundColor: Colors.white,
      ),
      body: OtpVerifyForm(phone: phone),
    );
  }
}
