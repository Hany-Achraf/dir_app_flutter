import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/category/components/body.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: kPrimaryColor,
        ),
        // icon: Icon(
        //   Icons.arrow_back,
        //   color: kTextColor,
        // ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            // color: kTextColor,
            color: kPrimaryColor,
          ),

          // icon: Icon(
          //   Icons.search,
          //   color: kTextColor,
          // ),
          onPressed: () {},
        ),
        // IconButton(
        //   icon: SvgPicture.asset(
        //     "assets/icons/cart.svg",
        //     // By default our  icon color is white
        //     color: kTextColor,
        //   ),
        //   onPressed: () {},
        // ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
