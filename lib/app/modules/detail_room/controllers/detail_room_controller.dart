import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:talktify/app/routes/app_pages.dart';

import '../../../data/models/room_model.dart';

class DetailRoomController extends GetxController {
  final Room roomData = Get.arguments;

  final isLoading = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void onInit() {
    user = auth.currentUser;
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

  void buyTicket() {
    isLoading.value = true;

    if (roomData.type == 'free') {
      saveTransaction();

      Get.offAllNamed(Routes.TRANSACTION_SUCCESS);
    } else {
      Get.toNamed(Routes.COMING_SOON);
    }

    isLoading.value = false;
  }

  Future saveTransaction() async {
    DateTime now = DateTime.now();
    final usersRef = FirebaseFirestore.instance.collection('users');

    usersRef.doc(user?.uid).collection("activities").doc().set({
      'name': roomData.name,
      'image': roomData.image,
      'mentor': roomData.mentor,
      'type': roomData.type,
      'date': roomData.date.toIso8601String(),
      'createdAt': now.toIso8601String(),
    });
  }
}
