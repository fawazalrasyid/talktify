import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/labeled_checkbox.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                  const Text(
                    "Yuk, Daftarkan Dirimu!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textTitleColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Masukkan email dan password kamu untuk mendaftarkan akun.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textBodyColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: const Text(
                          "Nama Lengkap",
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
                        keyboardType: TextInputType.text,
                        controller: controller.fullNameCtrl,
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
                          hintText: "Masukkan nama kamu",
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
                          "Username",
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
                        keyboardType: TextInputType.text,
                        controller: controller.usernameCtrl,
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
                          hintText: "Masukkan nama kamu",
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
                        keyboardType: TextInputType.text,
                        obscureText: controller.obscurePassword.value,
                        controller: controller.passwordCtrl,
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
                          suffixIcon: IconButton(
                            onPressed: () => controller.toggleObscurePassword(),
                            icon: controller.obscurePassword.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: AppColors.iconColorDefault,
                          ),
                          hintText: "Masukkan password kamu",
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
                          "Konfirmasi Password",
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
                        keyboardType: TextInputType.text,
                        obscureText: controller.obscureConfirmPassword.value,
                        controller: controller.confirmPasswordCtrl,
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
                          suffixIcon: IconButton(
                            onPressed: () =>
                                controller.toggleObscureConfirmPassword(),
                            icon: controller.obscureConfirmPassword.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: AppColors.iconColorDefault,
                          ),
                          hintText: "Masukkan ulang password kamu",
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
                            label: "Saya setuju dengan syarat & ketentuan",
                            value: controller.chechkbox.value,
                            onChanged: (bool newValue) {
                              controller.chechkbox.value = newValue;
                              controller.checkIsValidForm();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 76),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: controller.isValidForm.value
                          ? () => controller.register()
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
                              "Daftar",
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
                    onTap: () => Get.offNamed(Routes.LOGIN),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah memiliki akun? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Masuk",
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
    );
  }
}
