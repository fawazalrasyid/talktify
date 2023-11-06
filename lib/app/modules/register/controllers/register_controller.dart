import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final isLoading = false.obs;

  TextEditingController fullNameCtrl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  final obscurePassword = true.obs;
  final obscureConfirmPassword = true.obs;
  final chechkbox = false.obs;
  final isValidForm = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  User? user;

  Stream<User?> streamAuthStatus() {
    return auth.userChanges();
  }

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleObscureConfirmPassword() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  void checkIsValidForm() {
    isValidForm.value = fullNameCtrl.text.isNotEmpty &&
        usernameCtrl.text.isNotEmpty &&
        emailCtrl.text.isEmail &&
        passwordCtrl.text.isNotEmpty &&
        confirmPasswordCtrl.text.isNotEmpty &&
        passwordCtrl.text == confirmPasswordCtrl.text &&
        chechkbox.value == true;
  }

  void register() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailCtrl.text,
        password: passwordCtrl.text,
      );

      user = userCredential.user;

      if (user != null) {
        await user!.updateDisplayName(fullNameCtrl.text);
        await user!.sendEmailVerification();

        saveUserDataToFirestore();
      }

      Get.back();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email');
      } else {
        Fluttertoast.showToast(msg: 'There is an error! try again later.');
      }
    }
  }

  void saveUserDataToFirestore() {
    final usersRef = FirebaseFirestore.instance.collection('users');
    usersRef.doc(user?.uid).set({
      'id': user?.uid,
      'displayName': fullNameCtrl.text,
      'email': user?.email,
      'createdAt': user?.metadata.creationTime!.toIso8601String(),
    });
  }
}
