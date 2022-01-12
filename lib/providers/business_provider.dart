import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/review_model.dart';
import 'package:http/http.dart' as http;

class BusinessProvider extends ChangeNotifier {
  Business _business = null;
  Business get business => _business;

  void fetchBusiness({@required int businessId, @required int userId}) async {
    try {
      var response = await http.get(
        Uri.parse('$api/businesses/$businessId?user_id=$userId'),
        headers: {
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        _business = Business.fromJson(responseJson);
        fetchBusinessPhotos();
        fetchBusinessReviews();
      }
    } catch (ex) {
      rethrow;
    }
  }

  void fetchBusinessPhotos() async {
    try {
      var response = await http.get(
        Uri.parse('$api/businesses/${business.id}/photos'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var photosJson = json.decode(response.body);
        photosJson.forEach((photoJson) {
          _business.photos.add(photoJson['path']);
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  void fetchBusinessReviews() async {
    try {
      var response = await http.get(
        Uri.parse('$api/businesses/${business.id}/reviews'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var reviewsJson = json.decode(response.body);
        reviewsJson.forEach((reviewJson) {
          _business.reviews.add(Review.fromJson(reviewJson));
        });
      }
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

    var response;

    if (!business.onUserWishlist) {
      response = await http.post(
        Uri.parse('$api/wishlist/create'),
        body: requestData,
        headers: {
          'Accept': 'application/json',
        },
      );
    } else {
      response = await http.post(
        Uri.parse('$api/wishlist/destroy'),
        body: requestData,
        headers: {
          'Accept': 'application/json',
        },
      );
    }

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
