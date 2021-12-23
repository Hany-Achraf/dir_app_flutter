import 'package:flutter/material.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/review_model.dart';

class BusinessProvider extends ChangeNotifier {
  Business business = null;

  void setBusiness({@required Business business}) {
    this.business = business;
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
