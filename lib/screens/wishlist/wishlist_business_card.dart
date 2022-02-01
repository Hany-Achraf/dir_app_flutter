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
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BusinessScreen(businessId: business.id),
          ),
        );
      },
      isThreeLine: true,
      leading: Container(
        width: size.width * 0.2,
        decoration: BoxDecoration(
          color: Color(0xFFE7EBEE),
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
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.image,
              color: kPrimaryColor,
            ),
          ),
        ),
      ),
      title: Text(business.name),
      subtitle: Column(
        children: [
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
                child: Text(
                  'Added ${timeago.format(business.addedToWishlistDateTime, locale: 'en_short')} ago',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: PopupMenuButton(
        icon: Icon(
          Icons.more_horiz,
        ),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            onTap: () {
              Provider.of<BusinessesProvider>(context, listen: false)
                  .removeBusinessFromWishlist(
                businessId: business.id,
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
    );
  }
}
