import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/route.dart';

class OtpVerifyForm extends StatefulWidget {
  final String phone;
  const OtpVerifyForm({Key? key, required this.phone}) : super(key: key);

  @override
  State<OtpVerifyForm> createState() => _OtpVerifyFormState();
}

class _OtpVerifyFormState extends State<OtpVerifyForm> {
  final TextEditingController _otpController = TextEditingController();
  String? _error;

  void _verifyOtp() {
    final otp = _otpController.text.trim();
    if (otp.length == 6) {
      setState(() => _error = null);
      // Simulate successful login
      Get.offAllNamed(AppRoute.home);
    } else {
      setState(() => _error = 'رمز التحقق يجب أن يكون 6 أرقام');
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
                  'EnterOTP'.tr,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${'SentTo'.tr} ${widget.phone}',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    hintText: 'OTP',
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
                    onPressed: _verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'VerifyOTP'.tr,
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
