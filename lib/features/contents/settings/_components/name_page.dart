import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/colors.dart' as colors;
import '../../../../core/resources/strings.dart' as strings;
import '../../../../core/resources/text_styles.dart' as styles;

class NamePage extends StatelessWidget {
  final dynamic controller;
  const NamePage({required this.controller, super.key});

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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Obx(
          () => Text(
            controller.success.toString(),
            style: styles.paragraphMedium,
          ),
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
      ]),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: colors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            onPressed: () {
              controller.updateCollection();
            },
            child: const Text(
              strings.update,
              style: styles.buttonMedium,
            )),
      ),
    );
  }
}
