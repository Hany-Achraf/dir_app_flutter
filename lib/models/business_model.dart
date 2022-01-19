import 'package:flutter/material.dart';
import 'package:plant_app/models/review_model.dart';

class Business {
  int id;
  String name;
  int avgRate;
  String iconImgPath;
  String coverImgPath;
  String description;
  String phoneNo;
  String address;
  String iframeOnGoogleMaps;
  String linkOnGoogleMaps;
  String workingTime;
  String websiteLink;
  String facebookLink;
  String instagramLink;
  bool onUserWishlist;
  bool reviewedByUser;
  DateTime addedToWishlistDateTime;

  List<String> photos = [];
  List<Review> reviews = [];

  Business({
    this.id,
    this.name,
    this.avgRate,
    this.iconImgPath,
    this.coverImgPath,
    this.description,
    this.phoneNo,
    this.address,
    this.iframeOnGoogleMaps,
    this.linkOnGoogleMaps,
    this.workingTime,
    this.websiteLink,
    this.facebookLink,
    this.instagramLink,
    this.onUserWishlist,
    this.reviewedByUser,
    this.addedToWishlistDateTime,
  });

  factory Business.fromJson(Map<String, dynamic> parsedJson,
      {bool isWishlistBusiness = false}) {
    Business business = Business(
      id: parsedJson['id'],
      name: parsedJson['name'],
      avgRate: parsedJson['avg_rate'],
      iconImgPath: parsedJson['icon_img_path'],
      coverImgPath: parsedJson['cover_img_path'],
      description: parsedJson['description'],
      phoneNo: parsedJson['phone_no'],
      address: parsedJson['address'],
      iframeOnGoogleMaps: parsedJson['iframe_on_google_maps'],
      linkOnGoogleMaps: parsedJson['link_on_google_maps'],
      workingTime: parsedJson['working_time'],
      websiteLink: parsedJson['website_link'],
      facebookLink: parsedJson['facebook_link'],
      instagramLink: parsedJson['instagram_link'],
      onUserWishlist: parsedJson['on_user_wishlist'],
      reviewedByUser: parsedJson['reviewed_by_user'],
    );

    if (isWishlistBusiness) {
      business.addedToWishlistDateTime =
          DateTime.parse(parsedJson['wishlist']['created_at']);
    }

    return business;
  }
}
