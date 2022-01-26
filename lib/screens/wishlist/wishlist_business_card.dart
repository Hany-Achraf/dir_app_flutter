import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/providers/businesses_provider.dart';
import 'package:plant_app/screens/business/business_screen.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

Row _buildRatingStars(int rating) {
  List<Icon> ratingStars = [];
  for (int i = 0; i < 5; i++) {
    if (i < rating)
      ratingStars.add(Icon(Icons.star, color: Colors.yellow, size: 17));
    else
      ratingStars.add(Icon(Icons.star, color: Colors.grey.shade300, size: 17));
  }
  return Row(
    children: ratingStars,
  );
}

class WishlistBusinessCard extends StatelessWidget {
  final Business business;
  const WishlistBusinessCard({
    Key key,
    this.business,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BusinessScreen(businessId: business.id),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.12,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        '${api}/image?path=${business.iconImgPath}',
                        headers: {'Connection': 'keep-alive'},
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: size.width * 0.02,
                    ),
                    width: size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            text: TextSpan(
                              text: business.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        _buildRatingStars(business.avgRate),
                        Row(
                          children: [
                            Icon(
                              Icons.circle_rounded,
                              color: kPrimaryColor,
                              size: 7,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: size.width * 0.01),
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                  text:
                                      'Added ${timeago.format(business.addedToWishlistDateTime, locale: 'en_short')} ago',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_horiz,
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: () {
                  Provider.of<BusinessesProvider>(context, listen: false)
                      .removeBusinessFromWishlist(
                    businessId: business.id,
                    userId: Provider.of<Auth>(context, listen: false).user.id,
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.remove_circle_outline_rounded),
                    Container(
                        margin: EdgeInsets.only(left: size.width * 0.01),
                        child: Text('Remove from wishlist')),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
