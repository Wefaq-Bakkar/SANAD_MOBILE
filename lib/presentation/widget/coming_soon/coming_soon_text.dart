import 'package:flutter/material.dart';

class ComingSoonText extends StatelessWidget {
  const ComingSoonText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Coming Soon!',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
        Text(
          'This feature is under development and will be available soon.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
