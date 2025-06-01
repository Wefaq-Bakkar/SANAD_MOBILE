import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/route.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final TextEditingController _emailController = TextEditingController();
  String? _error;
  String? _success;

  void _submit() {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() {
        _error = 'EmptyValidate'.tr;
        _success = null;
      });
      return;
    }
    setState(() {
      _error = null;
      _success = 'ForgotPasswordSuccess'.tr;
    });
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(AppRoute.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ForgotPasswordTitle'.tr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: 'ForgotPasswordEmailHint'.tr,
                    border: const UnderlineInputBorder(),
                  ),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 10),
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                ],
                if (_success != null) ...[
                  const SizedBox(height: 10),
                  Text(_success!, style: const TextStyle(color: Colors.green)),
                ],
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'ForgotPasswordButton'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('ForgotPasswordRemember'.tr),
                    GestureDetector(
                      onTap: () => Get.offAllNamed(AppRoute.login),
                      child: Text(
                        'ForgotPasswordLoginHere'.tr,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
