import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../courses/courses_page.dart';
import '../profile/profile_page.dart';
import '../settings/settings_page.dart';
import 'dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.contents[controller.currentPageIndex.value],
        bottomNavigationBar: BottomAppBar(
          elevation: 15,
          color: colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  icon: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(
                      controller.currentPageIndex.value == 0
                          ? Assets.coursesFilled
                          : Assets.courses,
                    ),
                  ),
                  onPressed: () {
                    controller.currentScreen = const CoursesPage();
                    controller.currentPageIndex.value = 0;
                  }),
              IconButton(
                  icon: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(
                      controller.currentPageIndex.value == 1
                          ? Assets.profileFilled
                          : Assets.profile,
                    ),
                  ),
                  onPressed: () {
                    controller.currentScreen = const ProfilePage();
                    controller.currentPageIndex.value = 1;
                  }),
              IconButton(
                  icon: Transform.scale(
                    scale: 1.5,
                    child: Image.asset(
                      controller.currentPageIndex.value == 2
                          ? Assets.settingsFilled
                          : Assets.settings,
                    ),
                  ),
                  onPressed: () {
                    controller.currentScreen = const SettingsPage();
                    controller.currentPageIndex.value = 2;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
