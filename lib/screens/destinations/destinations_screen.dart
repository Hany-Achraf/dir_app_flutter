import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/destinations/components/body.dart';

class DestinationsScreen extends StatelessWidget {
  final Destination _destination = destinations[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(destination: _destination),
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
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kPrimaryColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
