import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:plant_app/services/dio.dart';

class PromotionsProvider extends ChangeNotifier {
  List<Promotion> _promotions = [];
  List<Promotion> get promotions => _promotions;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  Future<bool> loadInitialPromotions() async {
    if (_promotions.isEmpty) {
      Response response = await dio().get('/api/promotions');
      if (response.statusCode == 200) {
        gotNextPage = response.data['next_page_url'] != null ? true : false;
        List promotionsJson = response.data['data'];
        promotionsJson.forEach((i) {
          _promotions.add(Promotion.fromJson(i));
        });
      }
    }
    return true;
  }

  Future<bool> loadMorePromotions() async {
    if (!gotNextPage) return false;

    Response response =
        await dio().get('/api/promotions?page=${++currentPageNumber}');

    if (response.statusCode == 200) {
      gotNextPage = response.data['next_page_url'] != null ? true : false;
      List promotionsJson = response.data['data'];
      promotionsJson.forEach((i) {
        _promotions.add(Promotion.fromJson(i));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
