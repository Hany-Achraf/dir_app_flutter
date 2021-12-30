import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/category/components/body.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  CategoryScreen({this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        category: category,
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        // icon: SvgPicture.asset(
        //   "assets/icons/back.svg",
        //   color: kPrimaryColor,
        // ),
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
          size: 30.0,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          // icon: SvgPicture.asset(
          //   "assets/icons/search.svg",
          //   color: kPrimaryColor,
          // ),
          icon: Icon(
            Icons.search,
            color: kPrimaryColor,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
