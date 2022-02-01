import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/services/auth.dart';

class PromotionsProvider extends ChangeNotifier {
  final Auth auth;
  PromotionsProvider({@required this.auth});

  List<Promotion> _promotions = null;
  List<Promotion> get promotions => _promotions;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  void loadInitialPromotions() async {
    if (_promotions != null) {
      _promotions = null;
      currentPageNumber = 1;
    }

    var response = await http.get(
      Uri.parse('$api/promotions'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      _promotions = [];
      List promotionsJson = responseJson['data'];
      promotionsJson.forEach((promotionJson) {
        _promotions.add(Promotion.fromJson(promotionJson));
      });

      notifyListeners();
    }
  }

  Future<bool> loadMorePromotions() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse('$api/promotions?page=${++currentPageNumber}'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
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
