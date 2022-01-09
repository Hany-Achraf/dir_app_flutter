import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/review_model.dart';
import 'package:plant_app/services/dio.dart';
import 'package:http/http.dart' as http;

class BusinessProvider extends ChangeNotifier {
  Business _business = null;
  Business get business => _business;

  void fetchBusiness({@required int businessId, @required int userId}) async {
    try {
      Response response =
          await dio().get('/api/businesses/$businessId?user_id=$userId');
      if (response.statusCode == 200) {
        _business = Business.fromJson(response.data);
        fetchBusinessPhotos();
        fetchBusinessReviews();
      }
    } catch (ex) {
      rethrow;
    }
  }

  void fetchBusinessPhotos() async {
    try {
      Response response =
          await dio().get('/api/businesses/${business.id}/photos');
      List list = response.data;
      list.forEach((element) {
        _business.photos.add(element['path']);
      });
    } catch (e) {
      rethrow;
    }
  }

  void fetchBusinessReviews() async {
    try {
      Response response =
          await dio().get('/api/businesses/${_business.id}/reviews');
      List reviewsJson = response.data;

      _business.reviews.clear();
      reviewsJson.forEach((reviewJson) {
        _business.reviews.add(Review.fromJson(reviewJson));
      });
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  void handleFavoriteIconButtonClick({@required int userId}) async {
    Map<String, int> requestData = {
      'business_id': _business.id,
      'user_id': userId,
    };

    Response response;

    if (!business.onUserWishlist)
      response = await dio().post('/api/wishlist/create', data: requestData);
    else
      response = await dio().delete('/api/wishlist/destroy', data: requestData);

    if (response.statusCode == 200)
      _business.onUserWishlist = !_business.onUserWishlist;

    notifyListeners();
  }

  void addReview(Map<String, dynamic> requestJson) async {
    var response = await http.post(
      Uri.parse('$api/reviews/create'),
      body: requestJson,
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) fetchBusinessReviews();
  }

  void deleteReview(Map<String, dynamic> requestJson) async {
    var response = await http.delete(
      Uri.parse('$api/reviews/destroy'),
      body: requestJson,
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) fetchBusinessReviews();
  }
}
