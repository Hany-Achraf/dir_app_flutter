import 'package:flutter/material.dart';

class Category {
  final int id;
  final String name;
  final String imgPath;
  final List<Category> subcategories = [];

  Category({
    @required this.id,
    @required this.name,
    this.imgPath,
  });

  factory Category.fromJson(Map<String, dynamic> parsedJson) {
    Category category = Category(
      id: parsedJson['id'],
      name: parsedJson['name'],
      imgPath: parsedJson['img_path'],
    );

    if (parsedJson['subcategories'] != null) {
      category.subcategories.add(Category(id: category.id, name: 'All'));
      (parsedJson['subcategories'] as List).forEach((i) {
        category.subcategories.add(Category.fromJson(i));
      });
    }

    return category;
  }
}
