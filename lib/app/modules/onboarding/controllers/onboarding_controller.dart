import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

// import '../../../manager/app_manager.dart';

class OnboardingController extends GetxController {
  // late final AppManager _appManager;

  final List imgList = [
    'assets/images/onboarding-pic-1.png',
    'assets/images/onboarding-pic-2.png',
    'assets/images/onboarding-pic-3.png',
  ];

  final List<String> txtList = [
    'Chat With Awesome Mentors',
    'Anytime Anywhere!',
    'Chat With Awesome',
  ];

  final List<String> descList = [
    'Meet a great mentor? Only here is the place.',
    'Are you statisfied just hearing the sound? like podcast? if you chat here, you can see each other!',
    'Are you statisfied just hearing the sound? like podcast',
  ];

  final CarouselController carouselCtrl = CarouselController();

  final currIndex = 0.obs;

  void next() => currIndex.value < 2
      ? carouselCtrl.nextPage()
      : Get.offNamed(Routes.LOGIN);
}
