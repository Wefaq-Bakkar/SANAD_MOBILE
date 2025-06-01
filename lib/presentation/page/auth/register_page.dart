import 'package:flutter/material.dart';
import '../../widget/auth/register_form.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Register'.tr),
      backgroundColor: Colors.white,
     ),
      body: const RegisterForm(),
    );
  }
}
