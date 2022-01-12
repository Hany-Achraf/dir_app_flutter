import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/review_model.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class BusinessReviews extends StatefulWidget {
  const BusinessReviews({Key key}) : super(key: key);

  @override
  State<BusinessReviews> createState() => _BusinessReviewsState();
}

class _BusinessReviewsState extends State<BusinessReviews> {
  bool _bottomMenuIsShown = false;
  Row _buildRatingStars(int rating) {
    List<Icon> ratingStars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating)
        ratingStars.add(Icon(Icons.star, color: Colors.yellow));
      else
        ratingStars.add(Icon(Icons.star, color: Colors.grey.shade300));
    }
    return Row(
      children: ratingStars,
    );
  }

  Wrap _buildBottomMenu() {
    return Wrap(
      children: [
        // ListTile(
        //   leading: Icon(Icons.edit),
        //   title: Text('Edit'),
        //   onTap: () {},
        // ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('delete'),
          onTap: () {
            int userId = Provider.of<Auth>(context, listen: true).user.id;
            int businessId =
                Provider.of<BusinessProvider>(context, listen: true)
                    .business
                    .id;
            Map<String, dynamic> requestJson = {
              'user_id': '$userId',
              'business_id': '$businessId',
            };
            Provider.of<BusinessProvider>(context, listen: false)
                .deleteReview(requestJson);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void _showBottomMenu() {
    _bottomMenuIsShown = true;
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            height: 60,
            // height: MediaQuery.of(context).size.height * 0.1,
            child: _buildBottomMenu(),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget renderReview(Review review) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              backgroundImage:
                  NetworkImage('$url/${review.reviewer.avatarImgPath}'),
            ),
            InkWell(
              onTap: () {
                if (_bottomMenuIsShown) {
                  Navigator.of(context).pop();
                  _bottomMenuIsShown = false;
                }
                ;
              },
              onLongPress: () {
                User user = Provider.of<Auth>(context, listen: false).user;
                if (review.reviewerId != user.id) return;
                _showBottomMenu();
              },
              child: Container(
                margin: EdgeInsets.only(left: 8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(review.reviewer.getFullName(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildRatingStars(review.rate),
                          SizedBox(
                            width: 90,
                          ),
                          Text(
                            DateFormat('dd MMM yyyy').format(review.date),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 300,
                        child: ReadMoreText(
                          review.comment,
                          style: TextStyle(color: Colors.black),
                          trimLines: 2,
                          colorClickableText: kPrimaryColor,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
              ),
            ),
          ]),
    );
  }

  Column renderReviewsList(List<Review> reviews) {
    Column reviewsList = Column(
      children: [],
    );
    reviews.forEach((review) {
      reviewsList.children.add(renderReview(review));
    });
    return reviewsList;
  }

  @override
  Widget build(BuildContext context) {
    List<Review> reviews =
        Provider.of<BusinessProvider>(context, listen: true).business.reviews;

    return InkWell(
      onTap: () {
        if (_bottomMenuIsShown) {
          Navigator.of(context).pop();
          _bottomMenuIsShown = false;
        }
      },
      child: Container(
        margin: EdgeInsets.all(4),
        child: SingleChildScrollView(
          child: renderReviewsList(reviews),
        ),
      ),
    );
  }
}
