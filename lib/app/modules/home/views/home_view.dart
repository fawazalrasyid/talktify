import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:talktify/app/core/values/app_colors.dart';
import 'package:talktify/app/core/values/app_values.dart';
import 'package:talktify/app/core/widget/article_card.dart';
import 'package:talktify/app/core/widget/promotion_card.dart';
import 'package:talktify/app/core/widget/recommendation_room_card.dart';

import '../../../core/widget/carousel_indicator.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 24),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: AppValues.margin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Haloo 👋",
                      style: TextStyle(
                        color: AppColors.textBodyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      controller.user!.displayName!,
                      style: const TextStyle(
                        color: AppColors.textTitleColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        CarouselSlider(
                          carouselController: controller.promotionCarouselCtrl,
                          options: CarouselOptions(
                            aspectRatio: 2.5 / 1,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1,
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              controller.currPromotionIndex.value = index;
                            },
                          ),
                          items: controller.promotionList.value!.map((item) {
                            return Builder(
                              builder: (BuildContext context) {
                                return PromotionCard(
                                  image: item.image,
                                );
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: CarouselIndicator(
                            length: controller.promotionList.value!.length,
                            currentIndex: controller.currPromotionIndex.value,
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.padding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Rekomendasi Untukmu ✨",
                          style: TextStyle(
                            color: Color(0xff2a2d35),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Lihat Semua",
                            style: TextStyle(
                              color: AppColors.textPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : controller.roomList.value!.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.roomList.value!.length < 3
                              ? controller.roomList.value!.length
                              : 3,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return RecommendationRoomCard(
                              roomData: controller.roomList.value![index],
                              isFirst: index == 0,
                              isLast: index ==
                                  controller.roomList.value!.length - 1,
                            );
                          },
                        )
                      : Container(
                          height: 210,
                          color: AppColors.pageBackground,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppValues.largePadding,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 4),
                              SizedBox(
                                width: Get.width * 0.2,
                                child: Image.asset(
                                  "assets/images/room-not-found.png",
                                ),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppValues.padding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Artikel Terbaru 📰",
                          style: TextStyle(
                            color: Color(0xff2a2d35),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Lihat Semua",
                            style: TextStyle(
                              color: AppColors.textPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 210,
                child: controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.articleList.value!.isNotEmpty
                        ? ListView.builder(
                            itemCount: controller.articleList.value!.length,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ArticleCard(
                                articleData:
                                    controller.articleList.value![index],
                                isFirst: index == 0,
                                isLast: index ==
                                    controller.articleList.value!.length - 1,
                              );
                            },
                          )
                        : Container(
                            height: 210,
                            color: AppColors.pageBackground,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppValues.largePadding,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 4),
                                SizedBox(
                                  width: Get.width * 0.2,
                                  child: Image.asset(
                                    "assets/images/room-not-found.png",
                                  ),
                                ),
                                const SizedBox(height: 4),
                              ],
                            ),
                          ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
