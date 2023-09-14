import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes.dart';

class LoginController extends GetxController {
  final key = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool obscureText = true.obs;

  void toRegister() {
    Get.toNamed(Routes.register);
  }

  void toDashBoard() {
    Get.offAndToNamed(Routes.dashboard);
  }

  void login(String email, password) async {
    if (key.currentState!.validate()) {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        Future.delayed(3.seconds, () => Get.offAndToNamed(Routes.dashboard));
      } catch (e) {}
    }
  }
}
