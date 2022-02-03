import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/providers/businesses_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SubcategoriesSlider extends StatefulWidget {
  final int parentCategoryId;
  final List<Category> subcategories;
  final RefreshController refreshController;
  SubcategoriesSlider({
    @required this.parentCategoryId,
    @required this.subcategories,
    @required this.refreshController,
  });
  @override
  _SubcategoriesSliderState createState() => _SubcategoriesSliderState();
}

class _SubcategoriesSliderState extends State<SubcategoriesSlider> {
  int selectedSubcategoryId;

  @override
  void initState() {
    selectedSubcategoryId = widget.parentCategoryId;
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
      subcategoriesSlider.children
          .add(buildSubcategory(subcategory: subcategory));
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: subcategoriesSlider,
    );
  }

  Widget buildSubcategory({@required Category subcategory}) {
    return GestureDetector(
      onTap: () {
        widget.refreshController.resetNoData();
        Provider.of<BusinessesProvider>(context, listen: false)
            .loadInitialBusinesses(categoryId: subcategory.id);
        setState(() {
          selectedSubcategoryId = subcategory.id;
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
                color: selectedSubcategoryId == subcategory.id
                    ? kTextColor
                    : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
              height: 2,
              color: selectedSubcategoryId == subcategory.id
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
