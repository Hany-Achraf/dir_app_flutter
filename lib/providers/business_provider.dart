import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/review_model.dart';
import 'package:plant_app/services/dio.dart';

class BusinessProvider extends ChangeNotifier {
  Business business = null;

  Future<Business> fetchBusiness({@required int businessId}) async {
    try {
      Response response = await dio().get('/api/businesses/${businessId}');
      return Business.fromJson(response.data[0]);
    } catch (e) {
      rethrow;
    }
  }

  void loadBusinsessImgs() {}

  void loadBusinsessReviews() {
    if (business.id == 1)
      business.reviews = reviews1;
    else if (business.id == 2)
      business.reviews = reviews2;
    else if (business.id == 3) business.reviews = reviews3;
    // notifyListeners();
  }

  void addReview(Review review) {
    business.reviews.add(review);
    notifyListeners();
  }
}
