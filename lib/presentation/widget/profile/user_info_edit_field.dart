import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfoEditField extends StatelessWidget {
  const UserInfoEditField({
    super.key,
    required this.text,
    required this.child,
  });

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0 / 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              text.tr,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: child,
          ),
        ],
      ),
    );
  }
}
