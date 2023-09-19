import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/assets.dart';
import '../../../../core/resources/colors.dart' as colors;
import '../../../../core/resources/strings.dart' as strings;
import '../../../../core/resources/text_styles.dart' as styles;

class ViewCoursePage extends StatelessWidget {
  final dynamic controller;
  final dynamic data;
  const ViewCoursePage(
      {required this.controller, required this.data, super.key});

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
        title: Text(
          data.title,
          style: styles.heading24,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(data.image),
                const SizedBox(height: 20),
                const Text(
                  strings.aboutTheCourse,
                  style: styles.heading24,
                ),
                const SizedBox(height: 10),
                Text(
                  data.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: colors.dark,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  strings.duration,
                  style: styles.heading20,
                ),
                const SizedBox(height: 10),
                Text(
                  data.time,
                  style: const TextStyle(
                    fontSize: 14,
                    color: colors.dark,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Wrap(
        children: [
          Container(
            width: Get.width,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Obx(
              () => ElevatedButton(
                  onPressed: data.isButtonDisabled.value
                      ? null
                      : () {
                          controller.addCourse(data);
                        },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: const Text(
                    strings.addToMyCourses,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: colors.white,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
