import 'package:get/get.dart';

class MainController extends GetxController {
  var tabIndex = 0.obs;

  // final List<Widget> tabs = [
  //   const HomeView(),
  //   const HomeView(),
  //   const HomeView(),
  //   const HomeView(),
  // ];

  final count = 0.obs;
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

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }
}
