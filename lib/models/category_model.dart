import 'package:flutter/material.dart';

// List<Category> categories = [];

class Category {
  final int id;
  final String name;
  final String imgPath;
  final List<Category> subcategories = [];

  Category({
    @required this.id,
    @required this.imgPath,
    @required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    Category category = Category(
      id: parsedJson['id'],
      name: parsedJson['name'],
      imgPath: parsedJson['img_path'],
    );

    if (parsedJson['subcategories'] != null) {
      (parsedJson['subcategories'] as List).forEach((i) {
        category.subcategories.add(Category.fromJson(i));
      });

      // categories.add(category); // ****
    }

    return category;
  }
}

// List<Category> fashionSubcategories = [
//   Category(
//     id: 1,
//     name: 'All',
//   ),
//   Category(
//     id: 2,
//     name: 'Men',
//   ),
//   Category(
//     id: 3,
//     name: 'Woman',
//   ),
//   Category(
//     id: 4,
//     name: 'Jewellery',
//   ),
// ];

// List<Category> foodSubcategories = [
//   Category(
//     id: 1,
//     name: 'All',
//   ),
//   Category(
//     id: 2,
//     name: 'Breakfast',
//   ),
//   Category(
//     id: 3,
//     name: 'Arabian',
//   ),
//   Category(
//     id: 4,
//     name: 'Malay',
//   ),
//   Category(
//     id: 5,
//     name: 'Western',
//   ),
//   Category(
//     id: 6,
//     name: 'Chinese',
//   ),
// ];

// List<Category> categories = [
//   Category(
//     id: 1,
//     name: 'Fashion',
//     imgPath: 'assets/images/fashion.png',
//     // subcategories: fashionSubcategories,
//   ),
//   Category(
//     id: 2,
//     name: 'Food & Beverages',
//     imgPath: 'assets/images/food.png',
//     // subcategories: foodSubcategories,
//   ),
//   Category(id: 3, name: 'Cars', imgPath: 'assets/images/car.png'),
//   Category(id: 4, name: 'Health', imgPath: 'assets/images/health.png'),
//   Category(id: 5, name: 'Hotels', imgPath: 'assets/images/hotel.png'),
//   Category(id: 6, name: 'Beauty', imgPath: 'assets/images/beauty.png'),
//   Category(
//       id: 7, name: 'Legal Consultation', imgPath: 'assets/images/lawyer.png'),
//   Category(id: 8, name: 'Schools', imgPath: 'assets/images/school.png'),
//   Category(id: 9, name: 'Sports', imgPath: 'assets/images/sports.png'),
// ];
