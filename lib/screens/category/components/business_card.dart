import 'package:flutter/material.dart';
import 'package:plant_app/models/category_model.dart';

import '../../../constants.dart';

class BusinessCard extends StatelessWidget {
  final Category category;
  final Function press;
  const BusinessCard({
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
                color: Color(0xFFAEAEAE),
                borderRadius: BorderRadius.circular(16),
              ),
              // child: Hero(
              //   tag: "${product.id}",
              //   child: Image.asset(product.image),
              // ),
              child: Image.asset(category.imgUrl),
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
