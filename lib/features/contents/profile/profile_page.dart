// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;
import '_components/your_courses.dart';
import 'profile_controller.dart';
import '_components/save_page.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 30),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  Center(
                    child: Container(
                      height: 170,
                      decoration: const ShapeDecoration(
                        color: colors.lightGray,
                        shape: CircleBorder(
                            side: BorderSide(
                                color: colors.secondaryColor, width: 3.0)),
                      ),
                      child: controller
                                  .courses.loggedInUser.value.imageURL!.value !=
                              null
                          ? CircleAvatar(
                              radius: 74,
                              backgroundImage: NetworkImage(controller
                                  .courses.loggedInUser.value.imageURL!.value),
                            )
                          : CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(controller.noImage),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        controller.bottomSheet();
                      },
                      child: Container(
                        height: 30,
                        decoration: ShapeDecoration(
                            color: colors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: Image.asset(Assets.pen),
                      ),
                    ),
                  ),
                ],
              ),
              controller.isImageUploaded.value
                  ? SizedBox(
                      width: Get.width / 2,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: controller.saveProfile,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: const Text('Save Profile'),
                      ),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(YourCoursesPage(
                        controller: controller,
                      ));
                    },
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
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  controller.signOut();
                },
                child: const Text(
                  strings.logout,
                  style: styles.buttonSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
