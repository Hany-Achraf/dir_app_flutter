import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/review_model.dart';
import 'package:plant_app/services/dio.dart';

class BusinessProvider extends ChangeNotifier {
  Business _business;

  Business get business => _business;

  Future<Business> fetchBusiness({@required int businessId}) async {
    try {
      Response response = await dio().get('/api/businesses/${businessId}');
      if (response.statusCode == 200) {
        _business = Business.fromJson(response.data);
        fetchBusinessPhotos();
        fetchBusinessReviews();
        return _business;
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

  void addReview(Review review) {
    business.reviews.add(review);
    notifyListeners();
  }
}
