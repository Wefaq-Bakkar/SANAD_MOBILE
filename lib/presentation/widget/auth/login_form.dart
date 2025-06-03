
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/controllers/auth_controller.dart';
import '../../../core/constants/route.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = Get.find();
  String? _error;

  void _login() async {
    final phone = _phoneController.text.trim();
    final password = _passwordController.text;

    final success = await _authController.loginWithPassword(phone, password);
    if (success) {
      setState(() => _error = null);
      Get.offAllNamed(AppRoute.home);
    } else {
      setState(() => _error = _authController.errorMessage.value);
    }
  }


  void _goToRegister() {
    Get.toNamed(AppRoute.otpLogin);
  }

  void _goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
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
                  'SignInTitle'.tr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                // Phone Field
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    hintText: 'رقم الجوال',
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
                    hintText: 'SignInPasswordHint'.tr,
                    border: const UnderlineInputBorder(),
                  ),
                ),
                // Forgot Password Link
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _goToForgetPassword,
                    child: Text(
                      'SignInForgotPassword'.tr,
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('SignInNoAccount'.tr),
                    GestureDetector(
                      onTap: _goToRegister,
                      child: Text(
                        'OTPLogin'.tr, // Use a new translation key for OTP login
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                if (_error != null) ...[
                  const SizedBox(height: 10),
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                ],
                const SizedBox(height: 30),
                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'SignInButton'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
