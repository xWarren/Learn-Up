import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CoursesModels {
  final String image;
  final String hours;
  final String minutes;
  final String title;
  final String description;
  final RxBool isFavorite;
  final RxBool isButtonDisabled;

  const CoursesModels({
    required this.image,
    required this.hours,
    required this.minutes,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.isButtonDisabled,
  });

  static CoursesModels fromSnapshot(DocumentSnapshot snap) {
    CoursesModels courses = CoursesModels(
      image: snap['image'],
      hours: snap['hours'],
      minutes: snap['minutes'],
      title: snap['title'],
      description: snap['description'],
      isFavorite: RxBool(snap['isFavorite'] ?? false),
      isButtonDisabled: RxBool(snap['isButtonDisabled'] ?? false),
    );
    return courses;
  }
}
