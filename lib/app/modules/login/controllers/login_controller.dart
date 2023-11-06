import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final isLoading = false.obs;

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  final obscurePassword = true.obs;
  final chechkbox = false.obs;
  final isValidForm = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  checkIsValidForm() {
    isValidForm.value = emailCtrl.text.isEmail && passwordCtrl.text.isNotEmpty;
  }

  void login() async {
    try {
      isLoading.value = true;

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );

      User? user = userCredential.user;

      if (user != null) {
        Get.offAllNamed(Routes.MAIN);
      } else {}
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Fluttertoast.showToast(msg: 'Username atau password salah!');
      } else {
        Fluttertoast.showToast(msg: 'There is an error! try again later.');
      }
    }

    isLoading.value = false;
  }
}
