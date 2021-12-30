import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/services/dio.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  Future<bool> loadInitialCategories() async {
    if (_categories.isEmpty) {
      Response response = await dio().get('/api/categories');
      if (response.statusCode == 200) {
        gotNextPage = response.data['next_page_url'] != null ? true : false;
        List categoriesJson = response.data['data'];
        categoriesJson.forEach((i) {
          _categories.add(Category.fromJson(i));
        });
      }
    }
    return true;
  }

  Future<bool> loadMoreCategories() async {
    if (!gotNextPage) return false;

    Response response =
        await dio().get('/api/categories?page=${++currentPageNumber}');

    if (response.statusCode == 200) {
      gotNextPage = response.data['next_page_url'] != null ? true : false;
      List categoriesJson = response.data['data'];
      categoriesJson.forEach((i) {
        _categories.add(Category.fromJson(i));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
