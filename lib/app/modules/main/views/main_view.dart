import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:talktify/app/modules/activity/views/activity_view.dart';
import 'package:talktify/app/modules/profile/views/profile_view.dart';

import '../../../core/values/app_colors.dart';
import '../../explore/views/explore_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({super.key});
  @override
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex.value,
            children: [
              HomeView(),
              ExploreView(),
              ActivityView(),
              ProfileView()
            ],
          ),
          // body: controller.tabs[controller.tabIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.white,
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            selectedItemColor: AppColors.selectedNavbarIconColor,
            unselectedItemColor: AppColors.navbarIconColor,
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                icon: controller.tabIndex.value == 0
                    ? const Icon(IconlyBold.home)
                    : const Icon(IconlyBold.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex.value == 1
                    ? const Icon(IconlyBold.discovery)
                    : const Icon(IconlyBold.discovery),
                label: 'Eksplor',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex.value == 2
                    ? const Icon(IconlyBold.document)
                    : const Icon(IconlyBold.document),
                label: 'Aktivitas',
              ),
              BottomNavigationBarItem(
                icon: controller.tabIndex.value == 3
                    ? const Icon(IconlyBold.profile)
                    : const Icon(IconlyBold.profile),
                label: 'Profil',
              ),
            ],
          ),
        );
      },
    );
  }
}
