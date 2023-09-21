import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/models/courses_models.dart';
import '../../../core/data/models/info_models.dart';
import '../../../core/data/repositories/firebase_database.dart';
import '../../../core/routes/routes.dart';

class CoursesController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser;
  Rx<Info> loggedInUser = Info().obs;
  var favorite = {}.obs;
  var mycourse = {}.obs;
  RxString success = ''.obs;
  final course = <CoursesModels>[].obs;

  // ignore: prefer_typing_uninitialized_variables
  final nameController;
  // ignore: prefer_typing_uninitialized_variables
  final emailController;
  final passwordController = TextEditingController();

  // List courses = [
  //   CoursesModels(
  //     image: Assets.flutterLogo,
  //     time: "1 h 30 min",
  //     title: "Flutter",
  //     description:
  //         "Flutter transforms the app development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase.",
  //     isFavorite: true.obs,
  //     isButtonDisabled: false.obs,
  //   ),
  //   CoursesModels(
  //     image: Assets.reactLogo,
  //     time: "1 h 20 min",
  //     title: "React Native",
  //     description:
  //         "React Native combines the best parts of native development with React, a best-in-class JavaScript library for building user interfaces",
  //     isFavorite: true.obs,
  //     isButtonDisabled: false.obs,
  //   ),
  //   CoursesModels(
  //     image: Assets.kotlinLogo,
  //     time: "1 h 25 min",
  //     title: "Kotlin",
  //     description:
  //         "Kotlin is a cross-platform, statically typed, general-purpose high-level programming language with type inference. Kotlin is designed to interoperate fully with Java, and the JVM version of Kotlin's standard library depends on the Java Class Library, but type inference allows its syntax to be more concise.",
  //     isFavorite: true.obs,
  //     isButtonDisabled: false.obs,
  //   ),
  // ];

  CoursesController()
      : emailController = TextEditingController(),
        nameController = TextEditingController();

  @override
  void onInit() {
    update();
    getUser();
    course.bindStream(FirebasestoreDB().getAllCourses());
    super.onInit();
  }

  void getUser() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser.value = Info.fromMap(value.data());
      nameController.text = loggedInUser.value.name.toString();
      emailController.text = loggedInUser.value.email.toString();
    });
  }

  void updateCollection() {
    loggedInUser.value.name =
        nameController.text; // Extract the email from the controller
    Map<String, dynamic> dataToUpdate = {
      'name': loggedInUser.value.name
          .toString(), // Replace 'email' with the field name you want to update
    };
    success.value = "Your name has been updated!";

    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update(dataToUpdate) // Pass the Map to the update method
        .then((_) {
      // Successfully updated, navigate to the dashboard
      Future.delayed(2.seconds, clearText);
    }).catchError((error) {
      // Handle any errors that may occur during the update
      // ignore: avoid_print
      print("Error updating document: $error");
    });
  }

  void clearText() {
    success.value = '';
    Get.offAndToNamed(Routes.dashboard);
  }

  void addFavorite(CoursesModels course) {
    if (favorite.containsKey(course)) {
      favorite[course] += 1;
    } else {
      favorite[course] = 1;
    }
  }

  void removeFavorite(CoursesModels course) {
    if (favorite.containsKey(course) && favorite[course] == 1) {
      // Remove the course from favorites when interest reaches zero
      favorite.remove(course);
    } else if (favorite.containsKey(course) && favorite[course] > 1) {
      favorite[course] -= 1;
    }
  }

  void addCourse(CoursesModels course) {
    if (mycourse.containsKey(course)) {
      mycourse[course] == 1;
    } else {
      mycourse[course] = 1;
    }
    course.isButtonDisabled.value = mycourse.isNotEmpty;
  }

  get favorites => favorite;
  get mycourses => mycourse;
}
