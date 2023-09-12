import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnup/core/resources/assets.dart';

import 'package:learnup/features/contents/courses/courses_controller.dart';
import 'package:learnup/features/contents/courses/search_page.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;

class CoursesPage extends GetView<CoursesController> {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello,",
                            style: TextStyle(
                              fontSize: 16,
                              color: colors.dark,
                            )),
                        Text(
                          strings.nameJuanita,
                          style: styles.heading24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Image.asset(Assets.notify)),
                  )
                ],
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(SearchPage(controller: controller),
                    transition: Transition.native);
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: colors.gray))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Search course", style: styles.paragraphMedium),
                    Image.asset(Assets.search)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
