import 'package:flutter/material.dart';
import '../widget/coming_soon/coming_soon_image.dart';
import '../widget/coming_soon/coming_soon_text.dart';
import '../widget/coming_soon/coming_soon_button.dart';
import '../../core/themes/appcolor.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              ComingSoonImage(),
              SizedBox(height: 32),
              ComingSoonText(),
              SizedBox(height: 32),
              ComingSoonButton(text: 'Back to Home'),
            ],
          ),
        ),
      ),
    );
  }
}
