import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/screens/categories/categories_screen.dart';
import 'package:plant_app/screens/category/category_screen.dart';

class CategoriesNavigator extends StatelessWidget {
  Widget categoryIcon(BuildContext context, {Category category}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => category == null
                ? CategoriesScreen()
                : CategoryScreen(id: category.id),
          ),
        );
      },
      child: Container(
        height: 55.0,
        width: 55.0,
        decoration: BoxDecoration(
          color: Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(27.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Image.asset(
            category == null
                ? 'assets/images/more_horiz.webp'
                : category.imgUrl,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            categoryIcon(context, category: categories[0]),
            categoryIcon(context, category: categories[1]),
            categoryIcon(context, category: categories[2]),
            categoryIcon(context, category: categories[3]),
          ],
        ),
        SizedBox(height: kDefaultPadding / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            categoryIcon(context, category: categories[4]),
            categoryIcon(context, category: categories[5]),
            categoryIcon(context, category: categories[6]),
            categoryIcon(context),
          ],
        ),
      ],
    );
  }
}
