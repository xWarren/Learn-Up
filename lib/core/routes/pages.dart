import 'package:get/get.dart';
import 'package:learnup/core/routes/routes.dart';

import '../../features/onboarding/onboarding_binding.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/splash/splash_binding.dart';
import '../../features/splash/splash_page.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
  ];
}
