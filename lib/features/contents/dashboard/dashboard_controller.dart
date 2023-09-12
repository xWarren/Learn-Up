import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../courses/courses_page.dart';
import '../profile/profile_page.dart';
import '../settings/settings_page.dart';

class DashboardController extends GetxController {
  Widget? currentScreen;
  var currentPageIndex = 0.obs;

  void onTap(index) {
    currentPageIndex.value = index;
  }

  List<Widget> contents = [
    const CoursesPage(),
    const ProfilePage(),
    const SettingsPage(),
  ];
}
