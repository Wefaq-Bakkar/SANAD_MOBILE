
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/route.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _error;

  void _register() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() => _error = 'RegisterErrorEmpty'.tr);
      return;
    }
    if (password != confirmPassword) {
      setState(() => _error = 'RegisterErrorMatch'.tr);
      return;
    }
    // For design/demo, just show success and go to login
    setState(() => _error = null);
    Get.snackbar('Success', 'RegisterSuccess'.tr, backgroundColor: Colors.green.shade100);
    Future.delayed(const Duration(milliseconds: 500), () {
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
                  'RegisterTitle'.tr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                // Email Field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
                    hintText: 'RegisterEmailHint'.tr,
                    border: const UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Password Field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: 'RegisterPasswordHint'.tr,
                    border: const UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                // Confirm Password Field
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: 'RegisterConfirmPasswordHint'.tr,
                    border: const UnderlineInputBorder(),
                  ),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 10),
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                ],
                const SizedBox(height: 30),
                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'RegisterButton'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('RegisterHaveAccount'.tr),
                    GestureDetector(
                      onTap: () => Get.offAllNamed(AppRoute.login),
                      child: Text(
                        'RegisterLoginHere'.tr,
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
