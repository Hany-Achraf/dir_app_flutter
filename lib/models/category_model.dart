import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plant_app/constants.dart';

class Category {
  final int id;
  final String name;
  final String imgUrl;
  final List<Category> subcategories;

  Category({
    this.id,
    this.imgUrl,
    this.name,
    this.subcategories,
  });
}

List<Category> fashionSubcategories = [
  Category(
    id: 1,
    name: 'All',
  ),
  Category(
    id: 2,
    name: 'Men',
  ),
  Category(
    id: 3,
    name: 'Woman',
  ),
  Category(
    id: 4,
    name: 'Jewellery',
  ),
];

List<Category> foodSubcategories = [
  Category(
    id: 1,
    name: 'All',
  ),
  Category(
    id: 2,
    name: 'Breakfast',
  ),
  Category(
    id: 3,
    name: 'Arabian',
  ),
  Category(
    id: 4,
    name: 'Malay',
  ),
  Category(
    id: 5,
    name: 'Western',
  ),
  Category(
    id: 6,
    name: 'Chinese',
  ),
];

List<Category> categories = [
  Category(
    id: 1,
    name: 'Fashion',
    imgUrl: 'assets/images/fashion.png',
    subcategories: fashionSubcategories,
  ),
  Category(
    id: 2,
    name: 'Food & Beverages',
    imgUrl: 'assets/images/food.png',
    subcategories: foodSubcategories,
  ),
  Category(id: 3, name: 'Cars', imgUrl: 'assets/images/car.png'),
  Category(id: 4, name: 'Health', imgUrl: 'assets/images/health.png'),
  Category(id: 5, name: 'Hotels', imgUrl: 'assets/images/hotel.png'),
  Category(id: 6, name: 'Beauty', imgUrl: 'assets/images/beauty.png'),
  Category(
      id: 7, name: 'Legal Consultation', imgUrl: 'assets/images/lawyer.png'),
  Category(id: 8, name: 'Schools', imgUrl: 'assets/images/school.png'),
  Category(id: 9, name: 'Sports', imgUrl: 'assets/images/sports.png'),
];
