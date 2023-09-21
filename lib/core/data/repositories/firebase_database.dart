import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/courses_models.dart';

class FirebasestoreDB {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<CoursesModels>> getAllCourses() {
    return firebaseFirestore.collection('courses').snapshots().map((snapshot) {
      return snapshot.docs
          .map<CoursesModels>((doc) => CoursesModels.fromSnapshot(doc))
          .toList();
    });
  }
}
