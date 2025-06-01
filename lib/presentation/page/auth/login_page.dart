import 'package:flutter/material.dart';
import '../../widget/auth/login_form.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'.tr),
        backgroundColor: Colors.white,
      ),

      body: const LoginForm(),
    );
  }
}
