import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/destinations/destinations_screen.dart';
import 'package:plant_app/screens/events/events_screen.dart';
import 'package:plant_app/screens/home/components/events_slider.dart';
import 'package:plant_app/screens/promotions/promotions_screen.dart';

import 'categories_nav.dart';
import 'promotions_slider.dart';
import 'header_with_seachbox.dart';
import 'destinations_slider.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(),
          CategoriesNavigator(),
          SizedBox(height: kDefaultPadding / 2),
          TitleWithMoreBtn(
            title: "Top Destinations",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DestinationsScreen()),
              );
            },
          ),
          DestinationsSlider(),
          TitleWithMoreBtn(
            title: "Promotions",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PromotionsScreen()),
              );
            },
          ),
          PromotionsSlider(),
          TitleWithMoreBtn(
            title: "Events",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventsScreen(),
                ),
              );
            },
          ),
          EventsSlider(),
        ],
      ),
    );
  }
}
