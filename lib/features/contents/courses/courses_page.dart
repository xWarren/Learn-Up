import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learnup/features/contents/courses/courses_controller.dart';

class CoursesPage extends GetView<CoursesController> {
  const CoursesPage({super.key});

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
