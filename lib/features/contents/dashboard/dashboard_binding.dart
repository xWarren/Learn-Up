import 'package:get/get.dart';

import 'package:learnup/features/contents/dashboard/dashboard_controller.dart';
import '../courses/courses_controller.dart';
import '../profile/profile_controller.dart';
import '../settings/settings_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut<CoursesController>(() => CoursesController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
  }
}
