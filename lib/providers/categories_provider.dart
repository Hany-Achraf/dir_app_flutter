import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoriesProvider extends ChangeNotifier {
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  Future<bool> loadInitialCategories() async {
    if (_categories.isEmpty) {
      var response = await http.get(
        Uri.parse('$api/categories'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        gotNextPage = responseJson['next_page_url'] != null ? true : false;
        List categoriesJson = responseJson['data'];
        categoriesJson.forEach((categoryJson) {
          _categories.add(Category.fromJson(categoryJson));
        });
      }
    }
    return true;
  }

  Future<bool> loadMoreCategories() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse('$api/categories?page=${++currentPageNumber}'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      List categoriesJson = responseJson['data'];
      categoriesJson.forEach((categoryJson) {
        _categories.add(Category.fromJson(categoryJson));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
