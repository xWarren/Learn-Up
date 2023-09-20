import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/data/models/courses_models.dart';
import '../../../../core/resources/assets.dart';
import '../../../../core/resources/colors.dart' as colors;
import '../../../../core/resources/strings.dart' as strings;
import '../../../../core/resources/text_styles.dart' as styles;

class YourCoursesPage extends StatelessWidget {
  final dynamic controller;
  const YourCoursesPage({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(Assets.back)),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            strings.yourCourses,
            style: styles.heading24,
          ),
        ),
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Expanded(
            child: ListView.builder(
                itemCount: controller.courses.mycourses.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListPages(
                    index: index,
                    courses: controller.courses.mycourses.keys.toList()[index],
                    controller: controller,
                  );
                }),
          )
        ]));
  }
}

class ListPages extends StatelessWidget {
  final int index;
  final CoursesModels courses;
  final dynamic controller;
  const ListPages(
      {required this.index,
      required this.courses,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: ShapeDecoration(
          color: colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: colors.darkGray,
              ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: colors.lightGray,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      courses.image,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text(
              courses.title,
              style: styles.heading24,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              courses.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: colors.dark,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
