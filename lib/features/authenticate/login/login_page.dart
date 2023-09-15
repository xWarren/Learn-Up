import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learnup/features/authenticate/login/login_controller.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Form(
          key: controller.key,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Image.asset(
                Assets.loginLogo,
                height: 200,
              ),
            ),
            const Text(
              strings.login,
              style: styles.heading24,
            ),
            const SizedBox(height: 5),
            const Text(
              strings.loginWith,
              style: styles.paragraphMedium,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: ShapeDecoration(
                        color: colors.secondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Image.asset(
                      Assets.facebook,
                      alignment: Alignment.center,
                    )),
                const SizedBox(width: 10),
                Container(
                    height: 40,
                    width: 40,
                    decoration: ShapeDecoration(
                        color: colors.secondaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Image.asset(
                      Assets.google,
                      alignment: Alignment.center,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Obx(
              () => Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  children: [
                    Text(
                      controller.message.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: colors.error),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    strings.forgotPassword,
                    style: styles.buttonSmall,
                  )
                ],
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    controller.login(controller.emailController.text,
                        controller.passwordController.text);
                  },
                  child: const Text(
                    strings.login,
                    style: styles.buttonMedium,
                  )),
            ),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  controller.toRegister();
                },
                child: const Text(
                  strings.signUp,
                  style: styles.buttonSmall,
                ),
              )
            ]),
          ]),
        )),
      ),
    );
  }
}
