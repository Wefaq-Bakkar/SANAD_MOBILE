import 'package:flutter/material.dart';
import '../../widget/auth/otp_login_form.dart';
import 'package:get/get.dart';

class OtpLoginPage extends StatelessWidget {
  const OtpLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginByOTP'.tr),
        backgroundColor: Colors.white,
      ),
      body: const OtpLoginForm(),
    );
  }
}
