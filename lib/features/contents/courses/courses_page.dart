import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learnup/features/contents/courses/_components/search_page.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;
import '_components/view_course.dart';
import 'courses_controller.dart';

class CoursesPage extends GetView<CoursesController> {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(90),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(strings.hello,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: colors.dark,
                                    )),
                                Obx(
                                  () => Text(
                                    controller.loggedInUser.value.name
                                        .toString(),
                                    style: styles.heading24,
                                  ),
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
                      GestureDetector(
                        onTap: () {
                          Get.to(SearchPage(controller: controller),
                              transition: Transition.native);
                        },
                        child: Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(color: colors.gray))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(strings.searchCourse,
                                  style: styles.paragraphMedium),
                              Image.asset(Assets.search)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          body: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Text(
                    strings.category,
                    style: TextStyle(
                      fontSize: 14,
                      color: colors.dark,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 20,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: colors.secondaryColor,
                      ),
                      child: const Text(
                        "#CSS",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      height: 20,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: colors.secondaryColor,
                      ),
                      child: const Text(
                        "#UX",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      height: 20,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: colors.secondaryColor,
                      ),
                      child: const Text(
                        "#Flutter",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // ignore: unrelated_type_equality_checks
            controller.course.isEmpty
                ? Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    enabled: true,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: ShapeDecoration(
                          color: colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(
                                color: colors.darkGray,
                              ))),
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.course.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = controller.course[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(ViewCoursePage(
                            controller: controller,
                            data: data,
                          ));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
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
                                        image: NetworkImage(
                                          data.image,
                                        ))),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          data.hours,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: colors.success,
                                          ),
                                        ),
                                        const Text(
                                          "h",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: colors.success,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          data.minutes,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: colors.success,
                                          ),
                                        ),
                                        const Text(
                                          "min",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: colors.success,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Obx(
                                      () => GestureDetector(
                                        onTap: () {
                                          data.isFavorite.value =
                                              !data.isFavorite.value;

                                          if (!data.isFavorite.value) {
                                            controller.addFavorite(data);
                                          } else {
                                            controller.removeFavorite(data);
                                          }
                                        },
                                        child: Image.asset(
                                          data.isFavorite.value
                                              ? Assets.heart
                                              : Assets.heartFilled,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: Text(
                                  data.title,
                                  style: styles.heading24,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  data.description,
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
                        ),
                      );
                    },
                  ),
          ]))),
    );
  }
}
