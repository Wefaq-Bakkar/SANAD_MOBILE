import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../constants/imageasset.dart';
import '../constants/statusrequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
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
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    AppsImageAsset.offline,
                    fit: BoxFit.fill,
                    width: 250,
                    height: 250,
                  ),
                  Text(
                    "offlinefailure".tr,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w500),
                  )
                ],
              ))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(AppsImageAsset.serverfailure,
                          fit: BoxFit.contain, width: 250, height: 250),
                      Text(
                        "serverfailure".tr,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w500),
                      )
                    ],
                  ))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Column(
                        children: [
                          Lottie.asset(
                            AppsImageAsset.failure,
                            width: 250,
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            "failure".tr,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w500),
                          )
                        ],
                      ))
                    : widget;
  }
}
