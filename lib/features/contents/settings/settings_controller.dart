import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../courses/courses_controller.dart';

class SettingsController extends GetxController {
  final keyForm = GlobalKey<FormState>();
  RxBool notificationValue = false.obs;
  final CoursesController courses = Get.find();
}
