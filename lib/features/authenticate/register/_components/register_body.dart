import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/colors.dart' as colors;
import '../../../../core/resources/strings.dart' as strings;
import '../../../../core/resources/text_styles.dart' as styles;

class RegisterBody extends StatelessWidget {
  final dynamic controller;
  const RegisterBody({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.keyForm,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              Assets.registerLogo,
              height: 200,
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
              validator: (value) {
                RegExp regex = RegExp(r'^[A-Z-a-z]{1,}$');
                if (value!.isEmpty) {
                  return ("Please enter your name");
                }
                if (!regex.hasMatch(value)) {
                  return ("No Special Characters");
                }
                return null;
              },
              onSaved: (value) {
                controller.nameController.text = value!;
              },
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: controller.emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Please enter your Email");
                }
                // register expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+[@]+[gmail]+[.]+[com]")
                    .hasMatch(value)) {
                  return ("Gmail is the only valid email address.");
                }
                return null;
              },
              onSaved: (value) {
                controller.emailController.text = value!;
              },
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
                  controller.register(controller.emailController.text,
                      controller.passwordController.text);
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
