import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/categories/categories_screen.dart';
import 'package:plant_app/screens/categories/components/category_card.dart';

import 'promotions.dart';
import 'header_with_seachbox.dart';
import 'top_destinations.dart';
import 'title_with_more_bbtn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<IconData> _icons = [
    FontAwesomeIcons.coffee,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.breadSlice,
    FontAwesomeIcons.biking,
    FontAwesomeIcons.addressBook,
    FontAwesomeIcons.yoast,
    FontAwesomeIcons.youtube,
    FontAwesomeIcons.list,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesScreen(),
          ),
        );
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          // color: _selectedIndex == index
          //     ? Theme.of(context).dividerColor
          //     // ? kBackgroundColor
          //     : Color(0xFFE7EBEE),
          color: Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          // color: _selectedIndex == index
          //     ? Theme.of(context).primaryColor
          //     : Color(0xFFB4C1C4),
          color: Theme.of(context).primaryColor,
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
                children: _icons
                    .sublist(0, 4)
                    .asMap()
                    .entries
                    .map(
                      (MapEntry map) => _buildIcon(map.key),
                    )
                    .toList(),
              ),
              SizedBox(height: kDefaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .sublist(4, 8)
                    .asMap()
                    .entries
                    .map(
                      (MapEntry map) => _buildIcon(map.key + 4),
                    )
                    .toList(),
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding),
          TitleWithMoreBtn(title: "Top Destinations", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Promotions", press: () {}),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
