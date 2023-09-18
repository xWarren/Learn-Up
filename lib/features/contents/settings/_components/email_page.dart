import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/colors.dart' as colors;
import '../../../../core/resources/strings.dart' as strings;
import '../../../../core/resources/text_styles.dart' as styles;

class EmailPage extends StatelessWidget {
  final dynamic controller;
  const EmailPage({required this.controller, super.key});

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
            child: TextFormField(
              controller: controller.courses.emailController,
              textInputAction: TextInputAction.done,
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
                controller.courses.emailController.text = value!;
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
