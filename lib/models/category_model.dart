import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plant_app/constants.dart';

class Category {
  final int id;
  final String name;
  final String imgUrl;
  // final Color color;

  Category({
    this.id,
    this.imgUrl,
    this.name,
    // this.color,
  });
}

List<Category> categories = [
  Category(
      id: 1,
      name: 'Fashion',
      imgUrl: 'assets/images/shirt.png'), // ,color: HexColor('#ccffe6')),
  Category(id: 2, name: 'Food & Beverages', imgUrl: 'assets/images/food.png'),
  Category(id: 3, name: 'Cars', imgUrl: 'assets/images/car.png'),
  Category(id: 4, name: 'Sports', imgUrl: 'assets/images/sports.png'),
  Category(id: 5, name: 'Health', imgUrl: 'assets/images/health.png'),
  Category(
      id: 6, name: 'Legal Consultation', imgUrl: 'assets/images/lawyer.png'),
  Category(id: 7, name: 'Beauty', imgUrl: 'assets/images/beauty.png'),
  Category(id: 8, name: 'School', imgUrl: 'assets/images/school.webp'),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
