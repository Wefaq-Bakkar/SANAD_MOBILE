import 'package:flutter/material.dart';
import '../../widget/auth/reset_password_form.dart';
import 'package:get/get.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('ResetPassword'.tr),
        backgroundColor: Colors.white,
      ),
      body: const ResetPasswordForm(),
    );
  }
}
