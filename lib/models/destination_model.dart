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

// List<Destination> destinations = [
//   Destination(
//     id: 1,
//     name: 'The Mall Mid Valley SouthKey',
//     imgPath: 'assets/images/mid-valley-jb.png',
//   ),
//   Destination(
//     id: 2,
//     name: 'New York',
//     imgPath: 'assets/images/newyork.png',
//   ),
//   Destination(
//     id: 3,
//     name: 'Paris',
//     imgPath: 'assets/images/paris.png',
//   ),
//   Destination(
//     id: 4,
//     name: 'Santorini',
//     imgPath: 'assets/images/santorini.png',
//   ),
//   Destination(
//     id: 5,
//     name: 'Saopaulo',
//     imgPath: 'assets/images/saopaulo.png',
//   ),
// ];
