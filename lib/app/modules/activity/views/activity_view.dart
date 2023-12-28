import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/activity_card.dart';
import '../../../core/widget/recommendation_room_card.dart';
import '../controllers/activity_controller.dart';

class ActivityView extends GetView<ActivityController> {
  ActivityView({super.key});

  @override
  final ActivityController controller = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppValues.padding,
                ),
                child: const Text(
                  "Aktivitas",
                  style: TextStyle(
                    color: Color(0xff2a2d35),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : controller.activityList.value!.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.activityList.value!.length,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ActivityCard(
                              activityData:
                                  controller.activityList.value![index],
                              isFirst: index == 0,
                              isLast: index ==
                                  controller.activityList.value!.length - 1,
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
