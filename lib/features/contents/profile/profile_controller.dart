// ignore_for_file: unused_local_variable

import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/data/repositories/firebase_storage.dart';
import '../../../core/resources/assets.dart';
import '../../../core/routes/routes.dart';
import '../courses/courses_controller.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;

class ProfileController extends GetxController {
  final auth = FirebaseAuth.instance;
  Uint8List image = Uint8List.fromList([0]);
  late List<int> imageListInt = extractUint8List(image).obs;

  final CoursesController courses = Get.find();

  String noImage =
      "https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png";
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Future.delayed(3.seconds, () => Get.offAndToNamed(Routes.login));
  }

  Future<void> profileLogout() async {
    await FirebaseAuth.instance.signOut();
    Future.delayed(5.seconds, () => Get.offAndToNamed(Routes.login));
  }

  void bottomSheet() {
    Get.bottomSheet(
        backgroundColor: colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 70,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: colors.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                )
              ],
            ),
            ListTile(
                leading: CircleAvatar(
                    backgroundColor: colors.secondaryColor,
                    child: Image.asset(Assets.gallery)),
                title: const Text(strings.uploadPhoto),
                onTap: () {
                  selectImage();
                }),
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: colors.secondaryColor,
                  child: Image.asset(Assets.trash)),
              title: const Text(strings.deletePhoto),
              onTap: () {},
            ),
          ],
        ));
  }

  // Add a boolean flag to track if the image is uploaded but not saved.
  var isImageUploaded = false.obs;

  // Method to set the flag when an image is uploaded.
  void setImageUploaded(bool uploaded) {
    isImageUploaded.value = uploaded;
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    // ignore: avoid_print
    print('No Images Selected');
  }

  selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    // ignore: unnecessary_null_comparison
    if (img != null) {
      image = img;
      setImageUploaded(true);
      Get.back();
    }
  }

  void saveProfile() async {
    Get.snackbar("Profile picture has been changed",
        "In 5 seconds, you'll automatically log out to referesh your profile picture");
    String resp = await FirebaseStorageImage().saveData(file: image);

    await profileLogout();
  }

  List<int> extractUint8List(Uint8List source) {
    List<int> extractedList = [];
    for (int x in image) {
      extractedList.add(x);
    }
    return extractedList;
  }
}
