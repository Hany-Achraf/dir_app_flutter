import 'package:flutter/material.dart';
import 'package:plant_app/models/review_model.dart';

class Business {
  int id;
  String name;
  int avgRate;
  String iconImgPath;
  String coverImgPath;
  String description;
  String address;
  String phoneNo;
  String locationOnMap;
  String workingTime;
  String websiteLink;
  String facebookLink;
  String instagramLink;
  bool onUserWishlist;
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
    this.locationOnMap,
    this.workingTime,
    this.websiteLink,
    this.facebookLink,
    this.instagramLink,
    this.onUserWishlist,
    this.addedToWishlistDateTime,
  });

  factory Business.fromJson(Map<String, dynamic> parsedJson,
      {bool wishlistBusiness = false}) {
    Business business = Business(
      id: parsedJson['id'],
      name: parsedJson['name'],
      avgRate: parsedJson['avg_rate'],
      iconImgPath: parsedJson['icon_img_path'],
      coverImgPath: parsedJson['cover_img_path'],
      description: parsedJson['description'],
      phoneNo: parsedJson['phone_no'],
      address: parsedJson['address'],
      locationOnMap: parsedJson['location_on_map'],
      workingTime: parsedJson['working_time'],
      websiteLink: parsedJson['website_link'],
      facebookLink: parsedJson['facebook_link'],
      instagramLink: parsedJson['instagram_link'],
      onUserWishlist: parsedJson['on_user_wishlist'],
    );

    if (wishlistBusiness) {
      business.addedToWishlistDateTime =
          DateTime.parse(parsedJson['wishlist']['created_at']);
    }

    return business;
  }
}

// List<Business> businesses = [
//   Business(
//     id: 1,
//     name: 'Al-Ikhsan Sports',
//     iconImgPath: 'assets/images/al-ikhsan.png',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 3,
//   ),
//   Business(
//     id: 2,
//     name: 'Sogo',
//     iconImgPath: 'assets/images/sogo.png',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 4,
//   ),
//   Business(
//     id: 3,
//     name: 'Mr D.I.Y',
//     iconImgPath: 'assets/images/MRDIY.png',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 3,
//   ),
//   // ///////////
//   Business(
//     id: 4,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 4,
//   ),
//   Business(
//     id: 5,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 5,
//   ),
//   Business(
//     id: 6,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 1,
//   ),
//   Business(
//     id: 7,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 3,
//   ),
//   Business(
//     id: 8,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 2,
//   ),
//   Business(
//     id: 9,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 4,
//   ),
//   Business(
//     id: 10,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 4,
//   ),
//   Business(
//     id: 11,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 3,
//   ),
//   Business(
//     id: 12,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 5,
//   ),
//   Business(
//     id: 13,
//     name: 'Everyday Parenting: The ABCs of Child Rearing',
//     iconImgPath: 'assets/images/sunset.jpg',
//     workingTime: 'Sun – Wed (10:00 – 22:00)',
//     avgRate: 4,
//   ),
// ];
