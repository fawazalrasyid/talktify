import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final isLoading = false.obs;

  @override
  Future<void> onInit() async {
    user = auth.currentUser;
    super.onInit();
  }
}
