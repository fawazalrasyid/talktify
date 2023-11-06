import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:talktify/app/routes/app_pages.dart';

class SplashController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => checkUser());
    super.onInit();
  }

  Future checkUser() async {
    if (auth.currentUser == null) {
      Get.offNamed(Routes.ONBOARDING);
    } else {
      Get.offNamed(Routes.MAIN);
    }
  }
}
