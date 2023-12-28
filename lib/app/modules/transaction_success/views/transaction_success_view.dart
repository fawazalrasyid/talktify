import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talktify/app/core/values/app_colors.dart';
import 'package:talktify/app/core/values/app_values.dart';

import '../controllers/transaction_success_controller.dart';

class TransactionSuccessView extends GetView<TransactionSuccessController> {
  const TransactionSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: Container(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Transaksi berhasil!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            Image.asset(
              "assets/images/transaction_success.png",
              width: Get.width,
            ),
            const Text(
              'Detail transaksi akan\nsegera dikirimkan ke emailmu',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () => controller.goToHome(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  elevation: 0,
                  padding: const EdgeInsets.fromLTRB(64, 16, 64, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Kembali ke Home",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
