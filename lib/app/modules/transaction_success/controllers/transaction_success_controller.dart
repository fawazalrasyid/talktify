import 'package:get/get.dart';
import 'package:talktify/app/routes/app_pages.dart';

class TransactionSuccessController extends GetxController {
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

  void goToHome() {
    Get.offAllNamed(Routes.MAIN);
  }
}
