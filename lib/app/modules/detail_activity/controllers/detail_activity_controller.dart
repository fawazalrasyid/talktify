import 'package:get/get.dart';
import 'package:talktify/app/routes/app_pages.dart';

import '../../../data/models/activity_model.dart';

class DetailActivityController extends GetxController {
  final Activity activityData = Get.arguments;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void joinActivity() {
    isLoading.value = true;

    Get.toNamed(Routes.MEETING_ROOM);

    isLoading.value = false;
  }
}
