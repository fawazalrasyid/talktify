import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talktify/app/core/values/app_colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Haloo, ${controller.user!.displayName!}!",
          style: const TextStyle(
            color: AppColors.textBodyColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
