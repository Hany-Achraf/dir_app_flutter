import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:http/http.dart' as http;

class BusinessesProvider extends ChangeNotifier {
  List<Business> _businesses = null;
  List<Business> get businesses => _businesses;

  // bool gotNextPage = false;
  // int currentPageNumber = 1;

  Future<bool> loadInitialBusinesses(
      {int categoryId, int destinationId, int userId}) async {
    if (_businesses != null) {
      _businesses = null;
    }

    String route = (categoryId != null)
        ? '$api/categories/$categoryId'
        : (destinationId != null)
            ? '$api/destinations/$destinationId'
            : '$api/wishlist/$userId';

    var response = await http.get(
      Uri.parse(route),
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // gotNextPage = response.data['next_page_url'] != null ? true : false;
      // List categoriesJson = response.data['data'];
      List businessesJson = json.decode(response.body);
      _businesses = [];
      businessesJson.forEach((businessJson) {
        _businesses.add(Business.fromJson(businessJson,
            wishlistBusiness: (userId != null) ? true : false));
      });
      notifyListeners();
    }
    return true;
  }

  void removeBusinessFromWishlist(
      {@required int businessId, @required int userId}) async {
    Map<String, dynamic> requestData = {
      'business_id': '$businessId',
      'user_id': '$userId',
    };
    var response = await http.delete(
      Uri.parse('$api/wishlist/destroy'),
      body: requestData,
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      _businesses.removeWhere((business) => business.id == businessId);
      notifyListeners();
    }
  }
}
