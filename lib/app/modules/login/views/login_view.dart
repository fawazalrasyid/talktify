import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/labeled_checkbox.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.largePadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 32),
                    // SizedBox(
                    //   width: Get.width * 0.4,
                    //   child: Image.asset('assets/images/votergate.png'),
                    // ),
                    const Center(
                      child: Text(
                        'Talktify',
                        style: TextStyle(
                          color: Color(0xFF1EC1CE),
                          fontSize: 42,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Column(
                      children: [
                        Text(
                          "Halo, Selamat Datang Kembali! 👋",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textTitleColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Masukkan email dan password kamu untuk masuk kembali ke akun-mu.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textBodyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          child: const Text(
                            "Email",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.textSubtitleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailCtrl,
                          onChanged: (text) => controller.checkIsValidForm(),
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.textFieldBorderColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.textFieldBorderColor,
                              ),
                            ),
                            border: InputBorder.none,
                            hintText: "Masukkan email kamu",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: Get.width,
                          child: const Text(
                            "Password",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.textSubtitleColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.passwordCtrl,
                          obscureText: controller.obscurePassword.value,
                          onChanged: (text) => controller.checkIsValidForm(),
                          decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.textFieldBorderColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: AppColors.textFieldBorderColor,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  controller.toggleObscurePassword(),
                              icon: controller.obscurePassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              color: AppColors.iconColorDefault,
                            ),
                            border: InputBorder.none,
                            hintText: "Masukkan password kamu",
                            hintStyle: const TextStyle(
                              color: AppColors.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabeledCheckbox(
                              label: "Ingat Saya",
                              value: controller.chechkbox.value,
                              onChanged: (bool newValue) {
                                controller.chechkbox.value = newValue;
                              },
                            ),
                            const Text(
                              "Lupa Password",
                              style: TextStyle(
                                color: AppColors.errorColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 76),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                        onPressed: controller.isValidForm.value
                            ? () => controller.login()
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorPrimary,
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
                                "Masuk",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.textColorWhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.REGISTER),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Belum memiliki akun? ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Daftar Sekarang",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.colorPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
