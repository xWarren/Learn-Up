import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/data/models/onboarding_model.dart';
import '../../core/resources/assets.dart';
import '../../core/resources/strings.dart' as strings;
import '../../core/routes/routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  final kCurve = Curves.linear;

  void onPageChanged(index) {
    currentPageIndex.value = index;
    update();
  }

  void toLogin() {
    Get.offNamedUntil(Routes.login, (route) => false);
  }

  void goToPage() {
    if (currentPageIndex.value == 2) {
      Get.offNamedUntil(Routes.login, (route) => false);
    }
  }

  List onboarding = [
    const OnboardingModel(
      image: Assets.onboarding1,
      title: strings.onboardingTitle1,
      description: strings.onboardingDescription1,
    ),
    const OnboardingModel(
      image: Assets.onboarding2,
      title: strings.onboardingTitle2,
      description: strings.onboardingDescription2,
    ),
    const OnboardingModel(
      image: Assets.onboarding3,
      title: strings.onboardingTitle3,
      description: strings.onboardingDescription3,
    ),
  ];
}
