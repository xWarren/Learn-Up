import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/data/models/info_models.dart';
import '../../../core/routes/routes.dart';

class RegisterController extends GetxController {
  final keyForm = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late Rx<User?> user;
  RxBool obscureText = true.obs;

  void toLogin() {
    Get.back();
  }

  void toDashBoard() {
    Get.offAndToNamed(Routes.dashboard);
  }

  void register(String email, password) async {
    if (keyForm.currentState!.validate()) {
      try {
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFireBase()});
      } catch (e) {
        Get.snackbar("About User", "User Message",
            snackPosition: SnackPosition.TOP,
            titleText: const Text(
              "Account creation failed",
            ),
            messageText: Text(
              e.toString(),
            ));
      }
    }
  }

  postDetailsToFireBase() async {
    //calling the cloud firestore
    // sending the date from server
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;
    Info userClass = Info();

    //writing the value to send in server
    userClass.email = user!.email;
    userClass.uid = user.uid;
    userClass.name = nameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userClass.toMap());
    Future.delayed(3.seconds, () => Get.offAndToNamed(Routes.dashboard));
  }

  Future addUsersDetails(String name, String email) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'email': email, 'name': name});
  }
}
