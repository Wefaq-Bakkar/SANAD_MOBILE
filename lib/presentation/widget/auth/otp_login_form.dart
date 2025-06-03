import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/route.dart';
import '../../../domain/controllers/auth_controller.dart';

class OtpLoginForm extends StatefulWidget {
  const OtpLoginForm({Key? key}) : super(key: key);

  @override
  State<OtpLoginForm> createState() => _OtpLoginFormState();
}

class _OtpLoginFormState extends State<OtpLoginForm> {
  final TextEditingController _phoneController = TextEditingController();
  final AuthController _authController = Get.find();
  String? _error;

  void _sendOtp() async {
    final phone = _phoneController.text.trim();
   
    final success = await _authController.requestOtp(phone);
    if (success) {
      setState(() => _error = null);
      Get.toNamed(AppRoute.otpVerify, arguments: phone);
    } else {
      setState(() => _error = _authController.errorMessage.value);
    }
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
                  'LoginByOTP'.tr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    hintText: 'رقم الجوال',
                    border: const UnderlineInputBorder(),
                  ),
                ),
                if (_error != null) ...[
                  const SizedBox(height: 10),
                  Text(_error!, style: const TextStyle(color: Colors.red)),
                ],
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _sendOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'SendOTP'.tr,
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
