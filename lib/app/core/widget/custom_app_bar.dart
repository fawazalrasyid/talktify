import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../values/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final Color? buttonColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleColor,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                color: titleColor ?? const Color(0xFF2A2D35),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                IconlyBold.arrow_left_square,
                size: 28,
              ),
              color: buttonColor ?? AppColors.white,
            ),
          ],
        ),
      ],
    );
  }
}
