import 'package:flutter/material.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/constants.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function press;

  CategoryCard({
    this.category,
    this.press,
  });

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
                color: Color(0xFFE7EBEE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(
                '${api}/image?path=${category.imgPath}',
                headers: {'Connection': 'keep-alive'},
                color: kPrimaryColor,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: MediaQuery.of(context).size.width,
                  child: Icon(
                    Icons.image,
                    color: kPrimaryColor,
                  ),
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
