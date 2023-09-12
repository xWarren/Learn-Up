import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes.dart';

class RegisterController extends GetxController {
  final key = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool obscureText = true.obs;

  void toLogin() {
    Get.back();
  }

  void toDashBoard() {
    Get.offAndToNamed(Routes.dashboard);
  }
}
