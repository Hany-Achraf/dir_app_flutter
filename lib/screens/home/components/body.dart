import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/destinations/destinations_screen.dart';
import 'package:plant_app/screens/events/events_screen.dart';
import 'package:plant_app/screens/home/components/events_slider.dart';
import 'package:plant_app/screens/promotions/promotions_screen.dart';
import 'package:plant_app/services/dio.dart';

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
  Future homeJson;
  Future fetchHomeContent() async {
    try {
      Response response = await dio().get('api/');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    homeJson = fetchHomeContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeJson,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeaderWithSearchBox(),
                CategoriesNavigator(
                    categoriesJson: snapshot.data['categories']),
                SizedBox(height: kDefaultPadding / 2),
                TitleWithMoreBtn(
                  title: "Top Destinations",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DestinationsScreen()),
                    );
                  },
                ),
                DestinationsSlider(
                    destinationsJson: snapshot.data['destinations']),
                TitleWithMoreBtn(
                  title: "Promotions",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PromotionsScreen()),
                    );
                  },
                ),
                PromotionsSlider(promotionsJson: snapshot.data['promotions']),
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
                EventsSlider(
                  eventsJson: snapshot.data['events'],
                ),
              ],
            ),
          );
        }

        return Center(
            child: CircularProgressIndicator(
          color: kPrimaryColor,
        ));
      },
    );
  }
}
