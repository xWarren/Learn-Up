import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/routes/routes.dart';
import '../courses/courses_controller.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  final CoursesController courses = Get.find();
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Future.delayed(3.seconds, () => Get.offAndToNamed(Routes.login));
  }
}
