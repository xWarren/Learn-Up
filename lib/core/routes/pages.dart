import 'package:get/get.dart';
import 'package:learnup/core/routes/routes.dart';

import '../../features/authenticate/login/login_binding.dart';
import '../../features/authenticate/login/login_page.dart';
import '../../features/authenticate/register/register_binding.dart';
import '../../features/authenticate/register/register_page.dart';
import '../../features/contents/dashboard/dashboard_binding.dart';
import '../../features/contents/dashboard/dashboard_page.dart';
import '../../features/onboarding/onboarding_binding.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/splash/splash_binding.dart';
import '../../features/splash/splash_page.dart';

class Pages {
  static final pages = [
    GetPage(
        name: Routes.onboarding,
        page: () => const OnboardingPage(),
        binding: OnboardingBinding()),
    GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.register,
        page: () => const RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.dashboard,
        page: () => const DashboardPage(),
        binding: DashboardBinding()),
  ];
}
