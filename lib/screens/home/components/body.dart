import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/categories/categories_screen.dart';
import 'package:plant_app/screens/category/category_screen.dart';
import 'package:plant_app/screens/destinations/destinations_screen.dart';
import 'package:plant_app/screens/events/events_screen.dart';
import 'package:plant_app/screens/home/components/events.dart';
import 'package:plant_app/screens/promotions/promotions_screen.dart';

import 'promotions.dart';
import 'header_with_seachbox.dart';
import 'destinations.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> _icons = [
    'assets/images/hotel.png',
    'assets/images/food.png',
    'assets/images/car.png',
    'assets/images/health.png',
    'assets/images/shirt.png',
    'assets/images/beauty.png',
    'assets/images/lawyer.png',
    'assets/images/more_horiz.webp',
  ];

  Widget _buildIcon(int index, Widget targetScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => targetScreen,
          ),
        );
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        // child: Icon(
        //   _icons[index],
        //   size: 25.0,
        //   color: kPrimaryColor,
        // ),
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Image.asset(
            _icons[index],
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // children: _icons
                //     .sublist(0, 4)
                //     .asMap()
                //     .entries
                //     .map(
                //       (MapEntry map) => _buildIcon(map.key, ),
                //     )
                //     .toList(),
                children: [
                  _buildIcon(0, CategoryScreen()),
                  _buildIcon(1, CategoryScreen()),
                  _buildIcon(2, CategoryScreen()),
                  _buildIcon(3, CategoryScreen()),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: _icons
                //       .sublist(4, 8)
                //       .asMap()
                //       .entries
                //       .map(
                //         (MapEntry map) => _buildIcon(map.key + 4),
                //       )
                //       .toList(),
                children: [
                  _buildIcon(4, CategoryScreen()),
                  _buildIcon(5, CategoryScreen()),
                  _buildIcon(6, CategoryScreen()),
                  _buildIcon(7, CategoriesScreen()),
                ],
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding),
          TitleWithMoreBtn(
            title: "Top Destinations",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DestinationsScreen()),
              );
            },
          ),
          Destinations(),
          TitleWithMoreBtn(
            title: "Promotions",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PromotionsScreen(autoplay: true)),
              );
            },
          ),
          Promotions(),
          SizedBox(height: kDefaultPadding),
          TitleWithMoreBtn(
            title: "Events",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EventsScreen(autoplay: true)),
              );
            },
          ),
          Events(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
