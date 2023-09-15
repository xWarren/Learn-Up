class Info {
  String? uid;
  String? email;
  String? name;

  Info({this.uid, this.email, this.name});

  // receiving data from the server
  factory Info.fromMap(map) {
    return Info(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
    );
  }

  // sending the data from server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}
