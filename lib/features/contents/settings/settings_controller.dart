import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../core/data/models/info_models.dart';

class SettingsController extends GetxController {
  RxBool notificationValue = false.obs;
  User? user = FirebaseAuth.instance.currentUser;
  Rx<Info> loggedInUser = Info().obs;

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
