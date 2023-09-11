import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learnup/features/splash/splash_controller.dart';
import '../../core/resources/assets.dart';
import '../../core/resources/colors.dart' as colors;

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.splashLogo),
            const SizedBox(height: 10),
            const Text(
              "Learn Up",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: colors.dark,
              ),
            )
          ],
        ),
      ),
    );
  }
}
