import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:learnup/features/onboarding/onboarding_controller.dart';
import '../../core/resources/colors.dart' as colors;
import '../../core/resources/strings.dart' as strings;
import '../../core/resources/text_styles.dart' as styles;

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: GestureDetector(
                  onTap: () {
                    controller.toLogin();
                  },
                  child: controller.currentPageIndex.value == 0
                      ? const Text(strings.skip,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: colors.darkGray,
                          ))
                      : const SizedBox.shrink()),
            )
          ],
        ),
        body: Column(children: [
          const SizedBox(height: 30),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                Expanded(
                  child: PageView.builder(
                      controller: controller.pageController,
                      onPageChanged: controller.onPageChanged,
                      itemCount: controller.onboarding.length,
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = controller.onboarding[index];
                        return Column(
                          children: [
                            Image.asset(
                              data.image,
                              height: 230,
                              alignment: Alignment.center,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Text(
                                data.title,
                                textAlign: TextAlign.center,
                                style: styles.heading24,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                data.description,
                                textAlign: TextAlign.center,
                                style: styles.paragraphMedium,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ])),
        ]),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    controller.onboarding.length,
                    (index) => Container(
                          height: 5,
                          width: controller.currentPageIndex.value == index
                              ? 20
                              : 5,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: controller.currentPageIndex.value == index
                                ? colors.secondaryColor
                                : colors.darkGray.withOpacity(0.3),
                          ),
                        ))),
            const SizedBox(height: 50),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: controller.kCurve);
                    controller.goToPage();
                  },
                  child: Text(
                    controller.currentPageIndex.value == 2
                        ? strings.letsStart
                        : strings.next,
                    style: styles.buttonMedium,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
