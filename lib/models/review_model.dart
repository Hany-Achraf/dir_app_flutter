import 'package:flutter/material.dart';
import 'package:plant_app/models/user_model.dart';

class Review {
  int id;
  int rate;
  String comment;
  int reviewerId;
  // String reviewerName;
  // String reviewerAvatarImgPath;
  User reviewer;
  DateTime date;

  Review({
    @required this.id,
    @required this.rate,
    @required this.comment,
    @required this.reviewerId,
    // @required this.reviewerName,
    // @required this.reviewerAvatarImgPath,
    @required this.reviewer,
    @required @required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> parsedJson) {
    Review review = Review(
      id: parsedJson['id'],
      rate: parsedJson['rate'],
      comment: parsedJson['comment'],
      reviewerId: parsedJson['user']['id'],
      // reviewerName: parsedJson['user']['name'],
      // reviewerAvatarImgPath: parsedJson['user']['avatar_img_path'],
      reviewer: User.fromJson(parsedJson['user']),
      date: DateTime.parse(parsedJson['created_at']),
    );
    return review;
  }
}

// List<Review> reviews1 = [
//   Review(
//     rating: 4,
//     reviewerName: 'هاني أشرف',
//     comment:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     reviewerImgPath: 'assets/images/santorini.png',
//   ),
//   Review(
//     rating: 2,
//     reviewerName: 'Omar K. Al Wakeel',
//     comment:
//         'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
//     reviewerImgPath: 'assets/images/paris.png',
//   ),
//   Review(
//     rating: 3,
//     reviewerName: '楊仁忠',
//     comment: 'Very professional!',
//     reviewerImgPath: 'assets/images/murano.png',
//   ),
//   Review(
//     rating: 5,
//     reviewerName: 'Khaled Qabel',
//     comment:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     reviewerImgPath: 'assets/images/saopaulo.png',
//   ),
// ];

// List<Review> reviews2 = [
//   Review(
//     rating: 5,
//     reviewerName: 'Khaled Qabel',
//     comment:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     reviewerImgPath: 'assets/images/saopaulo.png',
//   ),
// ];

// List<Review> reviews3 = [
//   Review(
//     rating: 4,
//     reviewerName: 'هاني أشرف',
//     comment:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     reviewerImgPath: 'assets/images/santorini.png',
//   ),
//   Review(
//     rating: 2,
//     reviewerName: 'Omar K. Al Wakeel',
//     comment:
//         'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
//     reviewerImgPath: 'assets/images/paris.png',
//   ),
// ];
