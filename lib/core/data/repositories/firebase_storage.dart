import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageImage {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
      String childName, Uint8List file, String userId) async {
    // Generate a unique filename for each user using their user ID.
    String fileName = 'user_profile_image_$userId.jpg';
    Reference ref = storage.ref().child(childName).child(fileName);

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required Uint8List file,
  }) async {
    User? user = auth.currentUser;
    String resp = " Some Error Occurred";
    if (user != null) {
      try {
        String imageURL = await uploadImageToStorage('images', file, user.uid);
        await firestore.collection('users').doc(user.uid).update({
          'imageURL': imageURL,
        });

        resp = 'success';
      } catch (err) {
        resp = err.toString();
      }
    }
    return resp;
  }
}
