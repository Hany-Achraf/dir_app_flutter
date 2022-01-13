import 'package:flutter/material.dart';
import 'package:plant_app/models/user_model.dart';

class Review {
  int id;
  int rate;
  String comment;
  User reviewer;
  DateTime date;

  Review({
    @required this.id,
    @required this.rate,
    @required this.comment,
    @required this.reviewer,
    @required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> parsedJson) {
    return Review(
      id: parsedJson['id'],
      rate: parsedJson['rate'],
      comment: parsedJson['comment'],
      reviewer: User.fromJson(parsedJson['user']),
      date: DateTime.parse(parsedJson['created_at']),
    );
  }
}
