import 'package:get/get.dart';

class CoursesModels {
  final String image;
  final String time;
  final String title;
  final String description;
  final RxBool isFavorite;

  const CoursesModels({
    required this.image,
    required this.time,
    required this.title,
    required this.description,
    required this.isFavorite,
  });
}
