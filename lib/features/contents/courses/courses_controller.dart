import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/data/models/courses_models.dart';
import '../../../core/data/models/info_models.dart';
import '../../../core/resources/assets.dart';
import '../profile/profile_controller.dart';

class CoursesController extends GetxController {
  RxBool isFavorite1 = false.obs;
  RxBool isFavorite2 = false.obs;
  RxBool isFavorite3 = false.obs;
  User? user = FirebaseAuth.instance.currentUser;
  Rx<Info> loggedInUser = Info().obs;
  final ProfileController profileController = Get.find();

  List courses = [
    CoursesModels(
      image: Assets.flutterLogo,
      time: "1 h 30 min",
      title: "Flutter",
      description:
          "Flutter transforms the app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase.",
      isFavorite: true.obs,
    ),
    CoursesModels(
      image: Assets.reactLogo,
      time: "1 h 20 min",
      title: "React Native",
      description:
          "React Native combines the best parts of native development with React, a best-in-class JavaScript library for building user interfaces",
      isFavorite: true.obs,
    ),
    CoursesModels(
      image: Assets.kotlinLogo,
      time: "1 h 25 min",
      title: "Kotlin",
      description:
          "Kotlin is a cross-platform, statically typed, general-purpose high-level programming language with type inference. Kotlin is designed to interoperate fully with Java, and the JVM version of Kotlin's standard library depends on the Java Class Library, but type inference allows its syntax to be more concise.",
      isFavorite: true.obs,
    ),
  ];

  set isFavorite(bool value) {
    isFavorite = value;
  }

  @override
  void onInit() {
    update();
    getUser();
    super.onInit();
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser.value = Info.fromMap(value.data());
    });
  }
}
