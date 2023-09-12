import 'package:get/get.dart';

import '../../core/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    nextPage();
    super.onInit();
  }

  void nextPage() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offAndToNamed(Routes.onboarding);
    });
  }
}
