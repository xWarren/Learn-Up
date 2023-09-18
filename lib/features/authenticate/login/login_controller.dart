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
  RxBool isLoading = false.obs;
  RxString message = ''.obs;
  void toRegister() {
    Get.toNamed(Routes.register);
  }

  void toDashBoard() {
    Get.offAndToNamed(Routes.dashboard);
  }

  void login(String email, password) async {
    message.value = "";
    if (key.currentState!.validate()) {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        Future.delayed(3.seconds, () => Get.offAndToNamed(Routes.dashboard));
      } catch (e) {
        // Check if it's a Firebase error
        if (e is FirebaseException) {
          // Extract the error message without the Firebase text
          String errorMessage = e.message.toString();
          // Now, you can display the error message
          message.value = 'Login failed: $errorMessage';
        } else {
          // Handle non-Firebase errors differently
          message.value = 'An error occurred: ${e.toString()}';
        }
      }
    }
  }
}
