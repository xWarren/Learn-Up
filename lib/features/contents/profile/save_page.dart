import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;

class SavedPage extends StatelessWidget {
  final dynamic controller;
  const SavedPage({required this.controller, super.key});

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
        centerTitle: true,
        title: const Text(
          strings.saved,
          style: styles.heading24,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.notSaved),
          const SizedBox(height: 10),
          const Text(
            strings.courseNotSaved,
            style: styles.heading24,
          ),
          const SizedBox(height: 5),
          const Text(
            strings.trySaving,
            style: styles.paragraphMedium,
          ),
          Container(
            height: 50,
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text(
                  strings.continuee,
                  style: styles.buttonMedium,
                )),
          )
        ],
      ),
    );
  }
}
