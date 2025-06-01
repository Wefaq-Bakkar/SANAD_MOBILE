import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../constants/imageasset.dart';
import '../constants/statusrequest.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child:
                Lottie.asset(AppsImageAsset.loading, width: 250, height: 250))
        : widget;
  }
}
