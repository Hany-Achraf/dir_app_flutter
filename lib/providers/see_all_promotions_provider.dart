import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/promotion_model.dart';

class SeeAllPromotionsProvider extends ChangeNotifier {
  String searchQuery;

  List<Promotion> _promotions = [];
  List<Promotion> get promotions => _promotions;

  bool gotNextPage = false;
  int currentPageNumber = 0;

  Future<bool> seeAllPromotions({@required String searchQuery}) async {
    searchQuery = searchQuery;

    if (_promotions.isNotEmpty) {
      _promotions.clear();
      currentPageNumber = 1;
    }

    var response = await http.get(
      Uri.parse('$api/promotions/search?search_query=${searchQuery}'),
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
    return true;
  }

  Future<bool> loadMorePromotions() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse(
          '$api/promotions/search?search_query=${this.searchQuery}&page=${++currentPageNumber}'),
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
