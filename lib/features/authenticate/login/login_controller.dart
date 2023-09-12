import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes.dart';

class LoginController extends GetxController {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool obscureText = true.obs;

  void toRegister() {
    Get.toNamed(Routes.register);
  }

  void toDashBoard() {
    Get.offAndToNamed(Routes.dashboard);
  }
}
