import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/services/auth.dart';

class BusinessesProvider extends ChangeNotifier {
  final Auth auth;
  BusinessesProvider({@required this.auth});

  List<Business> _businesses = null;
  List<Business> get businesses => _businesses;

  bool _isWishlist = false;
  bool get isWishlist => _isWishlist;

  String route;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  void loadInitialBusinesses({int categoryId, int destinationId}) async {
    if (_businesses != null) {
      _businesses = null;
      currentPageNumber = 1;
    }

    if (categoryId != null) {
      _isWishlist = false;
      route = 'categories/$categoryId';
    } else if (destinationId != null) {
      _isWishlist = false;
      route = 'destinations/$destinationId';
    } else {
      _isWishlist = true;
      route = 'wishlist/${auth.user.id}';
    }

    var response = await http.get(
      Uri.parse('$api/$route'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      _businesses = [];
      List businessesJson = responseJson['data'];
      businessesJson.forEach((businessJson) {
        _businesses.add(
            Business.fromJson(businessJson, isWishlistBusiness: _isWishlist));
      });
      notifyListeners();
    }
  }

  Future<bool> loadMoreBusinesses() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse('$api/$route?page=${++currentPageNumber}'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      List businessesJson = responseJson['data'];
      businessesJson.forEach((businessJson) {
        _businesses.add(
            Business.fromJson(businessJson, isWishlistBusiness: _isWishlist));
      });
      notifyListeners();
    }

    return gotNextPage;
  }

  void removeBusinessFromWishlist({@required int businessId}) async {
    Map<String, dynamic> requestData = {
      'business_id': '$businessId',
      'user_id': '${auth.user.id}',
    };
    var response = await http.delete(
      Uri.parse('$api/wishlist/destroy'),
      body: requestData,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
    );
    if (response.statusCode == 200) {
      _businesses.removeWhere((business) => business.id == businessId);
      notifyListeners();
    }
  }

  void removeFromWishlistScreen({@required int businessId}) {
    _businesses.removeWhere((business) => business.id == businessId);
    notifyListeners();
  }
}
