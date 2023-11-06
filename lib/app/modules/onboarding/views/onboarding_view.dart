import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talktify/app/core/values/app_values.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({Key? key}) : super(key: key);

  @override
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFF1EC1CE),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Column(
                  children: [
                    CarouselSlider(
                      carouselController: controller.carouselCtrl,
                      options: CarouselOptions(
                        height: Get.height * 0.6,
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          controller.currIndex.value = index;
                        },
                      ),
                      items: controller.imgList.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              item,
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Container(
                      width: Get.width,
                      height: Get.height * 0.4,
                      padding: const EdgeInsets.all(AppValues.largePadding),
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 32),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller
                                      .txtList[controller.currIndex.value],
                                  style: const TextStyle(
                                    color: Color(0xFF3F3351),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  controller
                                      .descList[controller.currIndex.value],
                                  style: const TextStyle(
                                    color: Color(0xFF525252),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 20,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                SizedBox(
                                  height: 8,
                                  child: Expanded(
                                    child: Center(
                                      child: ListView.builder(
                                        itemCount: controller.imgList.length,
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 8,
                                            width: controller.currIndex.value ==
                                                    index
                                                ? 24
                                                : 8,
                                            margin:
                                                const EdgeInsets.only(right: 8),
                                            decoration: ShapeDecoration(
                                              color:
                                                  controller.currIndex.value ==
                                                          index
                                                      ? const Color(0xFFFF8787)
                                                      : const Color(0xffF2F2F2),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () => controller.next(),
                                      child: const Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Color(0xFF3F3351),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
