import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learnup/core/resources/assets.dart';

import 'package:learnup/features/contents/profile/profile_controller.dart';
import 'package:learnup/features/contents/profile/save_page.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          strings.profile,
          style: styles.heading24,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Container(
              height: 170,
              decoration: const ShapeDecoration(
                  color: colors.lightGray,
                  shape: CircleBorder(
                      side:
                          BorderSide(color: colors.secondaryColor, width: 3.0)),
                  image: DecorationImage(image: AssetImage(Assets.avatar))),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 70,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: colors.gray))),
                child: const Text(
                  strings.yourCourses,
                  style: styles.heading24,
                )),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 70,
            child: ElevatedButton(
                onPressed: () {
                  Get.to(SavedPage(controller: controller));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: colors.gray))),
                child: const Text(
                  strings.saved,
                  style: styles.heading24,
                )),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 70,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: colors.gray))),
                child: const Text(
                  strings.payment,
                  style: styles.heading24,
                )),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              controller.logOut();
            },
            child: const Text(
              strings.logout,
              style: styles.buttonSmall,
            ),
          )
        ],
      ),
    );
  }
}
