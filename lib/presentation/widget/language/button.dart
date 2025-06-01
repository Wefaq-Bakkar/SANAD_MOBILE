import 'package:flutter/material.dart';

import '../../../core/themes/appcolor.dart';
import '../../../core/themes/appstyle.dart';

class LanguageButton extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const LanguageButton({super.key, required this.textbutton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      margin: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primarycolor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(textbutton, style: AppStyle.button),
      ),
    );
  }
}
