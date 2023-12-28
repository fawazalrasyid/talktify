import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:talktify/app/core/values/app_colors.dart';

import '../../../core/values/app_values.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  @override
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
              child: Column(
                children: [
                  SizedBox(
                    width: Get.width * 0.3,
                    height: Get.width * 0.3,
                    child: SvgPicture.asset(
                      'assets/images/avatar.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    child: Text(
                      "${controller.user!.displayName}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    "Bergabung sejak ${DateFormat('d MMMM yyyy').format(controller.user!.metadata.creationTime!)}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF929299),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pengaturan",
                    style: TextStyle(
                      color: Color(0xff030319),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffe7eaf2),
                          ),
                          child: const SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              IconlyBold.editSquare,
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "Edit Profil",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff464646),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffe7eaf2),
                          ),
                          child: const SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              IconlyBold.lock,
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "Kebijakan Privasi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff464646),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffe7eaf2),
                          ),
                          child: const SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              IconlyBold.chat,
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "FAQs",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff464646),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffe7eaf2),
                          ),
                          child: const SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              IconlyBold.document,
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "Laporan Saya",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff464646),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffe7eaf2),
                          ),
                          child: const SizedBox(
                            width: 20,
                            height: 20,
                            child: Icon(
                              IconlyBold.notification,
                              color: Color(0xff8F92A1),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          "Notifikasi",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff464646),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppValues.margin),
              width: Get.width,
              child: ElevatedButton(
                onPressed: () => controller.logout(),
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
                        "Keluar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColorWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
