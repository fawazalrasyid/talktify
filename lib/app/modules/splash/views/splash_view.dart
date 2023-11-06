import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  SplashView({super.key});

  @override
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3), () {
    //   Get.offAllNamed(Routes.ONBOARDING);
    // });
    return const Scaffold(
      body: Center(
          child: Text(
        'Talktify',
        style: TextStyle(
          color: Color(0xFF1EC1CE),
          fontSize: 42,
          fontWeight: FontWeight.w800,
        ),
      )),
    );
  }
}
