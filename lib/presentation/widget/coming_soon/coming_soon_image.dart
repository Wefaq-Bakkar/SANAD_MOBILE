import 'package:flutter/material.dart';
import '../../../core/constants/imageasset.dart';

class ComingSoonImage extends StatelessWidget {
  const ComingSoonImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppsImageAsset.appLogo,
      width: 180,
      height: 180,
      fit: BoxFit.contain,
    );
  }
}
