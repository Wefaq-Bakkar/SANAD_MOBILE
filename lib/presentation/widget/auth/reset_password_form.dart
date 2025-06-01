import 'package:flutter/material.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Send Reset Link'),
          ),
        ],
      ),
    );
  }
}
