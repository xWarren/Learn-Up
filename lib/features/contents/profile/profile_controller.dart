import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/models/courses_models.dart';
import '../../../core/resources/assets.dart';
import '../../../core/routes/routes.dart';
import '../courses/courses_controller.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  var mycourses = {}.obs;
  final CoursesController courses = Get.find();
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Future.delayed(3.seconds, () => Get.offAndToNamed(Routes.login));
  }

  void addCourse(CoursesModels course) {
    if (mycourses.containsKey(course)) {
      mycourses[course] += 1;
    } else {
      mycourses[course] = 1;
    }
    Get.snackbar("GEe", "Ga");
  }

  void bottomSheet() {
    Get.bottomSheet(
        backgroundColor: colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 70,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: colors.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
            ListTile(
                leading: CircleAvatar(
                    backgroundColor: colors.secondaryColor,
                    child: Image.asset(Assets.camera)),
                title: const Text(strings.takePhoto),
                onTap: () {}),
            ListTile(
                leading: CircleAvatar(
                    backgroundColor: colors.secondaryColor,
                    child: Image.asset(Assets.gallery)),
                title: const Text(strings.uploadPhoto),
                onTap: () {}),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: colors.secondaryColor,
                  child: Image.asset(Assets.trash)),
              title: const Text(strings.deletePhoto),
              onTap: () {},
            ),
          ],
        ));
  }
}
