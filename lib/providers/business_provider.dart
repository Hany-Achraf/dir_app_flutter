import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/review_model.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/services/auth.dart';

class BusinessProvider extends ChangeNotifier {
  final Auth auth;
  BusinessProvider({@required this.auth});

  Business _business = null;
  Business get business => _business;

  void fetchBusiness({@required int businessId}) async {
    try {
      var response = await http.get(
        Uri.parse('$api/businesses/${businessId}?user_id=${auth.user.id}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${auth.token}',
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
        Uri.parse('$api/businesses/${_business.id}/photos'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${auth.token}',
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
        Uri.parse('$api/businesses/${_business.id}/reviews'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${auth.token}',
        },
      );
      if (response.statusCode == 200) {
        _business.reviews = [];
        var reviewsJson = json.decode(response.body);
        reviewsJson.forEach((reviewJson) {
          _business.reviews.add(Review.fromJson(reviewJson));
        });

        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  void handleFavoriteIconButtonClick() async {
    Map<String, dynamic> requestData = {
      'business_id': '${_business.id}',
      'user_id': '${auth.user.id}',
    };

    var response;

    if (!_business.onUserWishlist) {
      response = await http.post(
        Uri.parse('$api/wishlist/create'),
        body: requestData,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${auth.token}',
        },
      );
    } else {
      response = await http.delete(
        Uri.parse('$api/wishlist/destroy'),
        body: requestData,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${auth.token}',
        },
      );
    }

    if (response.statusCode == 200)
      _business.onUserWishlist = !_business.onUserWishlist;

    notifyListeners();
  }

  void addReview(Map<String, dynamic> requestJson) async {
    requestJson.addAll({
      'user_id': '${auth.user.id}',
      'business_id': '${_business.id}',
    });

    var response = await http.post(
      Uri.parse('$api/reviews/create'),
      body: requestJson,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
    );

    if (response.statusCode == 200) {
      _business.reviewedByUser = true;
      fetchBusinessReviews();
      notifyListeners();
    }
  }

  void deleteReview() async {
    Map<String, dynamic> requestJson = {
      'user_id': '${auth.user.id}',
      'business_id': '${_business.id}',
    };

    var response = await http.delete(
      Uri.parse('$api/reviews/destroy'),
      body: requestJson,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
    );

    if (response.statusCode == 200) {
      _business.reviewedByUser = false;
      fetchBusinessReviews();
      notifyListeners();
    }
  }
}
