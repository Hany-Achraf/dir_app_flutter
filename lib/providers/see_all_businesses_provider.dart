import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';

class SeeAllBusinessesProvider extends ChangeNotifier {
  String searchQuery;

  List<Business> _businesses = [];
  List<Business> get businesses => _businesses;

  bool gotNextPage = false;
  int currentPageNumber = 0;

  Future<bool> seeAllBusinesses({@required String searchQuery}) async {
    searchQuery = searchQuery;

    if (_businesses.isNotEmpty) {
      _businesses.clear();
      currentPageNumber = 1;
    }

    var response = await http.get(
      Uri.parse('$api/businesses/search?search_query=${searchQuery}'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      List businessesJson = responseJson['data'];
      businessesJson.forEach((businessJson) {
        _businesses.add(Business.fromJson(businessJson));
      });
      notifyListeners();
    }
    return true;
  }

  Future<bool> loadMoreBusinesses() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse(
          '$api/businesses/search?search_query=${this.searchQuery}&page=${++currentPageNumber}'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      List businessesJson = responseJson['data'];
      businessesJson.forEach((businessJson) {
        _businesses.add(Business.fromJson(businessJson));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
