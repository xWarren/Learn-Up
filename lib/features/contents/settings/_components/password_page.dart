import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/colors.dart' as colors;
import '../../../../core/resources/strings.dart' as strings;
import '../../../../core/resources/text_styles.dart' as styles;

class PasswordPage extends StatelessWidget {
  final dynamic controller;
  const PasswordPage({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Obx(
              () => TextFormField(
                autofocus: false,
                controller: controller.passwordController,
                obscureText: controller.obscureText.value,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ("Please enter your password");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter valid password(Min. 6 Character)");
                  }
                  return null;
                },
                onSaved: (value) {
                  controller.passwordController.text = value!;
                },
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
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: colors.gray),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: colors.gray),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: colors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            onPressed: () {},
            child: const Text(
              strings.update,
              style: styles.buttonMedium,
            )),
      ),
    );
  }
}
