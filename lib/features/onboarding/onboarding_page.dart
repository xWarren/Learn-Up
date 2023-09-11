import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learnup/features/onboarding/onboarding_controller.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("hello")),
        ],
      ),
    );
  }
}
