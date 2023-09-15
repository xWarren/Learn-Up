import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/data/models/courses_models.dart';
import '../../../core/routes/routes.dart';

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  var favorite = {}.obs;
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Future.delayed(3.seconds, () => Get.offAndToNamed(Routes.login));
  }

  void addFavorite(CoursesModels courses) {
    if (favorite.containsKey(courses)) {
      favorite[courses] += 1;
    } else {
      favorite[courses] = 1;
    }

    Get.snackbar("Added", "text");
  }

  void removeFavorite(CoursesModels courses) {
    if (favorite.containsKey(courses) && favorite[courses] == 1) {
    } else {
      favorite[courses] -= 1;
    }
    Get.snackbar("Removed", "text");
  }
}
