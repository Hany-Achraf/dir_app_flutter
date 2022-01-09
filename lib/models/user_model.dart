import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String email;

  User({@required int this.id, @required this.name, @required this.email});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'],
      name: parsedJson['name'],
      email: parsedJson['email'],
    );
  }
}
