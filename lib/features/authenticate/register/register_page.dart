import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learnup/features/authenticate/register/register_controller.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(Assets.back)),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              Assets.registerLogo,
              alignment: Alignment.center,
            ),
          ),
          const Text(
            strings.signUp,
            style: styles.heading24,
          ),
          const SizedBox(height: 5),
          const Text(
            strings.create,
            style: styles.paragraphMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: controller.nameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: colors.white,
                  filled: true,
                  hintText: strings.name,
                  hintStyle: styles.paragraphMedium,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: colors.gray)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: colors.gray),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: controller.emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: colors.white,
                  filled: true,
                  hintText: strings.email,
                  hintStyle: styles.paragraphMedium,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: colors.gray)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: colors.gray),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Obx(
              () => TextFormField(
                controller: controller.passwordController,
                obscureText: controller.obscureText.value,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    fillColor: colors.white,
                    filled: true,
                    hintText: strings.password,
                    hintStyle: styles.paragraphMedium,
                    suffixIcon: GestureDetector(
                        onTap: () {
                          controller.obscureText.value =
                              !controller.obscureText.value;
                        },
                        child: Image.asset(
                          controller.obscureText.value
                              ? Assets.hide
                              : Assets.show,
                        )),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: colors.gray)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: colors.gray),
                    )),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                onPressed: () {
                  controller.toDashBoard();
                },
                child: const Text(
                  strings.signUp,
                  style: styles.buttonMedium,
                )),
          ),
          const SizedBox(height: 5),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
              onTap: () {
                controller.toLogin();
              },
              child: const Text(
                strings.login,
                style: styles.buttonSmall,
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
