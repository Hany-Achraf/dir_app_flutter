import 'package:flutter/material.dart';
import 'package:plant_app/models/category_model.dart';

import '../../../constants.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function press;
  const CategoryCard({
    Key key,
    this.category,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                // color: product.color,
                color: Color(0xFFE7EBEE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${category.id}",
                child: Image.asset(
                  category.imgUrl,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text(
                category.name,
                style: TextStyle(color: kTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
