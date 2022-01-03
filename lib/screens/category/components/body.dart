import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:plant_app/screens/business/business_screen.dart';
import 'package:plant_app/screens/category/components/sub_categories_slider.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final Category category;
  final List<Business> _businesses = businesses;

  Body({this.category});

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

  @override
  Widget build(BuildContext context) {
    // Category category =
    //     categories.firstWhere((category) => category.id == categoryId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Text(
              category.name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        category.subcategories.isEmpty
            ? Container()
            : SubcategoriesSlider(category.subcategories),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 15.0),
            itemCount: _businesses.length,
            itemBuilder: (BuildContext context, int index) {
              Business business = _businesses[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BusinessScreen(businessId: 2)),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                  // height: 150,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        color: kPrimaryColor.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        // height: 100,
                        // width: 100,
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.height * 0.14,
                        margin: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                            // borderRadius: BorderRadius.circular(50),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.14 / 2),
                          ),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(50),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.14 / 2),
                            child: Image.asset(
                              business.iconImgPath,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // width: 255,
                        width: MediaQuery.of(context).size.width * 0.63,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              business.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            _buildRatingStars(business.avgRate),
                            SizedBox(height: 10.0),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 190.0,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                business.workingTime,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
