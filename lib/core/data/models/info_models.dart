import 'package:get/get.dart';

class Info {
  String? uid;
  String? email;
  String? name;
  RxString? imageURL =
      'https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png'
          .obs;

  Info({this.uid, this.email, this.name, String? imageURL}) {
    this.imageURL = imageURL?.obs;
  }

  // receiving data from the server
  factory Info.fromMap(map) {
    return Info(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      imageURL: map['imageURL'],
    );
  }

  // sending the data from server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'imageURL': imageURL!.value,
    };
  }
}
