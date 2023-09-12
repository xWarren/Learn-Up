import 'package:get/get.dart';
import 'package:learnup/core/routes/routes.dart';

class ProfileController extends GetxController {
  void logOut() {
    Get.offAndToNamed(Routes.login);
  }
}
