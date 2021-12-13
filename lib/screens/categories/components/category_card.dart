import 'package:flutter/material.dart';
import 'package:plant_app/models/Product.dart';

import '../../../constants.dart';

class CategoryCard extends StatelessWidget {
  final Product product;
  final Function press;
  const CategoryCard({
    Key key,
    this.product,
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
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                // color: product.color,
                color: Color(0xFFE7EBEE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
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
                // products is out demo list
                product.title,
                style: TextStyle(color: kTextColor),
              ),
            ),
          ),
          // Text(
          //   "\$${product.price}",
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // )
        ],
      ),
    );
  }
}
