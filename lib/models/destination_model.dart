import 'package:flutter/material.dart';

class Destination {
  int id;
  String name;
  String imgPath;

  Destination({
    @required this.id,
    @required this.name,
    @required this.imgPath,
  });

  factory Destination.fromJson(Map<String, dynamic> parsedJson) {
    return Destination(
      id: parsedJson['id'],
      name: parsedJson['name'],
      imgPath: parsedJson['img_path'],
    );
  }
}
