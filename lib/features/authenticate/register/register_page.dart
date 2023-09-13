import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '_components/register_body.dart';
import 'register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(Assets.back)),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: RegisterBody(controller: controller));
  }
}
