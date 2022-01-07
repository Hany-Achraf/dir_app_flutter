import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/services/dio.dart';

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
        ? 'api/categories/$categoryId'
        : (destinationId != null)
            ? 'api/destinations/$destinationId'
            : 'api/wishlist/$userId';

    Response response = await dio().get(route);
    if (response.statusCode == 200) {
      // gotNextPage = response.data['next_page_url'] != null ? true : false;
      // List categoriesJson = response.data['data'];
      List businessesJson = response.data;
      _businesses = [];
      businessesJson.forEach((i) {
        _businesses.add(Business.fromJson(i,
            wishlistBusiness: (userId != null) ? true : false));
      });
      notifyListeners();
    }
    return true;
  }

  void removeBusinessFromWishlist(
      {@required int businessId, @required int userId}) async {
    Map<String, int> requestData = {
      'business_id': businessId,
      'user_id': userId,
    };
    Response response =
        await dio().delete('api/wishlist/destroy', data: requestData);
    if (response.statusCode == 200) {
      _businesses.removeWhere((business) => business.id == businessId);
      notifyListeners();
    }
  }

  // Future<bool> loadMoreCategories() async {
  //   if (!gotNextPage) return false;

  //   Response response =
  //       await dio().get('/api/categories?page=${++currentPageNumber}');

  //   if (response.statusCode == 200) {
  //     gotNextPage = response.data['next_page_url'] != null ? true : false;
  //     List categoriesJson = response.data['data'];
  //     categoriesJson.forEach((i) {
  //       _categories.add(Category.fromJson(i));
  //     });
  //     notifyListeners();
  //   }

  //   return gotNextPage;
  // }
}
