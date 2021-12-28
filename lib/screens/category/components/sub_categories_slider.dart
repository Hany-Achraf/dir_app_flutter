import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_app/models/category_model.dart';

import '../../../constants.dart';

// We need satefull widget for our categories

class SubcategoriesSlider extends StatefulWidget {
  final List<Category> subcategories;
  SubcategoriesSlider(this.subcategories);

  @override
  _SubcategoriesSliderState createState() => _SubcategoriesSliderState();
}

class _SubcategoriesSliderState extends State<SubcategoriesSlider> {
  int selectedSubcategoryId;

  @override
  void initState() {
    selectedSubcategoryId = widget.subcategories[0].id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: buildSubcategoriesSlider(),
      ),
    );
  }

  Widget buildSubcategoriesSlider() {
    Row subcategoriesSlider = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );

    widget.subcategories.forEach((subcategory) {
      subcategoriesSlider.children.add(buildSubcategory(subcategory.id));
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: subcategoriesSlider,
    );
  }

  Widget buildSubcategory(int subcategoryId) {
    Category subcategory = widget.subcategories
        .firstWhere((subcategory) => subcategory.id == subcategoryId);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSubcategoryId = subcategoryId;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              subcategory.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedSubcategoryId == subcategoryId
                    ? kTextColor
                    : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
              height: 2,
              color: selectedSubcategoryId == subcategoryId
                  ? kTextColor
                  : Colors.transparent,
              child: Text('_' * subcategory.name.length),
            ),
          ],
        ),
      ),
    );
  }
}
