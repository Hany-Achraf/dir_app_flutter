import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:http/http.dart' as http;

class PromotionsProvider extends ChangeNotifier {
  List<Promotion> _promotions = [];
  List<Promotion> get promotions => _promotions;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  Future<bool> loadInitialPromotions() async {
    if (_promotions.isEmpty) {
      var response = await http.get(
        Uri.parse('$api/promotions'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        gotNextPage = responseJson['next_page_url'] != null ? true : false;
        List promotionsJson = responseJson['data'];
        promotionsJson.forEach((promotionJson) {
          _promotions.add(Promotion.fromJson(promotionJson));
        });
      }
    }
    return true;
  }

  Future<bool> loadMorePromotions() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse('$api/promotions?page=${++currentPageNumber}'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      List promotionsJson = responseJson['data'];
      promotionsJson.forEach((promotionJson) {
        _promotions.add(Promotion.fromJson(promotionJson));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
