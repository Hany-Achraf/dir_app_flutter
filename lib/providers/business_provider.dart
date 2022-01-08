import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/review_model.dart';
import 'package:plant_app/services/dio.dart';

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
        business.photos.add(element['path']);
      });
    } catch (e) {
      rethrow;
    }
  }

  void fetchBusinessReviews() async {
    try {
      Response response =
          await dio().get('/api/businesses/${business.id}/reviews');
      List list = response.data;
      list.forEach((element) {
        business.reviews.add(Review.fromJson(element));
      });
    } catch (e) {
      rethrow;
    }
    // notifyListeners();
  }

  void handleFavoriteIconButtonClick({@required int userId}) async {
    Map<String, int> requestData = {
      'business_id': business.id,
      'user_id': userId,
    };

    Response response;

    if (!business.onUserWishlist)
      response = await dio().post('/api/wishlist/create', data: requestData);
    else
      response = await dio().delete('/api/wishlist/destroy', data: requestData);

    if (response.statusCode == 200)
      business.onUserWishlist = !business.onUserWishlist;

    notifyListeners();
  }

  void addReview(Review review) {
    business.reviews.add(review);
    notifyListeners();
  }
}
