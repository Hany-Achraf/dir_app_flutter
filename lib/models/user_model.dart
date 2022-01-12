import 'package:flutter/material.dart';

class User {
  int id;
  String firstname;
  String lastname;
  String email;
  String avatarImgPath;

  User({
    @required this.id,
    @required this.firstname,
    @required this.lastname,
    @required this.email,
    @required this.avatarImgPath,
  });

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'],
      firstname: parsedJson['firstname'],
      lastname: parsedJson['lastname'],
      email: parsedJson['email'],
      avatarImgPath: parsedJson['avatar_img_path'],
    );
  }

  String getFullName() => '$firstname $lastname';
}
