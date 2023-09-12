import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learnup/core/resources/assets.dart';

import 'package:learnup/features/contents/settings/settings_controller.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          strings.settings,
          style: styles.heading24,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              Assets.settingsLogo,
              height: 190,
            ),
            Obx(
              () => Container(
                height: 70,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: colors.gray))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: colors.secondaryColor,
                            child: Image.asset(Assets.notification),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            strings.notifications,
                            style: styles.heading20,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.notificationValue.value =
                              !controller.notificationValue.value;
                        },
                        child: Image.asset(controller.notificationValue.value
                            ? Assets.switchOn
                            : Assets.switchOff),
                      )
                    ]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    strings.accountInformation,
                    style: styles.heading20,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: colors.gray))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: colors.secondaryColor,
                            child: Image.asset(Assets.name),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                strings.name,
                                style: styles.heading20,
                              ),
                              Text(
                                strings.nameJuanita,
                                style: styles.paragraphMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(Assets.next),
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: colors.gray))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: colors.secondaryColor,
                            child: Image.asset(Assets.email),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                strings.email,
                                style: styles.heading20,
                              ),
                              Text(
                                strings.email,
                                style: styles.paragraphMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(Assets.next),
                    ]),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(color: colors.gray))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: colors.secondaryColor,
                            child: Image.asset(Assets.password),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                strings.password,
                                style: styles.heading20,
                              ),
                              Text(
                                strings.passwordChanged,
                                style: styles.paragraphMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(Assets.next),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
