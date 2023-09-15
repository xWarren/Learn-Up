import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/models/info_models.dart';

class SettingsController extends GetxController {
  final keyForm = GlobalKey<FormState>();
  RxBool notificationValue = false.obs;
  User? user = FirebaseAuth.instance.currentUser;
  Rx<Info> loggedInUser = Info().obs;
  RxString success = ''.obs;
  final auth = FirebaseAuth.instance;
  // ignore: prefer_typing_uninitialized_variables
  final nameController;
  // ignore: prefer_typing_uninitialized_variables
  final emailController;
  final passwordController = TextEditingController();

  SettingsController()
      : emailController = TextEditingController(),
        nameController = TextEditingController();

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
    }).catchError((error) {
      // Handle any errors that may occur during the update
      print("Error updating document: $error");
    });
  }
}
