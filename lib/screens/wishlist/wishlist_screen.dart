import 'package:flutter/material.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/screens/business/business_screen.dart';

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

class WishlistScreen extends StatelessWidget {
  final List<Business> _businesses = businesses.sublist(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: _businesses.length,
        itemBuilder: (context, index) {
          return SavedBusiness(business: _businesses[index]);
        },
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

class SavedBusiness extends StatelessWidget {
  final Business business;
  const SavedBusiness({
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
                  MaterialPageRoute(builder: (context) => BusinessScreen()),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: 120,
                    width: size.width * 0.3,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child:
                          Image.asset(business.iconImgPath, fit: BoxFit.fill),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 8,
                    ),
                    // width: 200,
                    width: size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              margin: const EdgeInsets.only(left: 5),
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                text: TextSpan(
                                  text: 'Added 6d ago',
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
                child: Row(
                  children: [
                    Icon(Icons.remove_circle_outline_rounded),
                    Container(
                        margin: const EdgeInsets.only(left: 4),
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
