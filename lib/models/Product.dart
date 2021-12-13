import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plant_app/constants.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Fashion",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/shirt.png",
      color: Color(0xFF3D82AE)),
  // color: HexColor('#ccffe6')),
  Product(
      id: 2,
      title: "Food & Beverages",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/food.png",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Cars",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/car.png",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Sports",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/sports.png",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Health",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/health.png",
      color: Color(0xFFFB7883)),
  Product(
      id: 6,
      title: "Legal Consultation",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/lawyer.png",
      color: Color(0xFFAEAEAE)),
  Product(
      id: 6,
      title: "Beauty",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/beauty.png",
      color: Color(0xFFAEAEAE)),
  Product(
      id: 6,
      title: "School",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/school.webp",
      color: Color(0xFFAEAEAE)),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
