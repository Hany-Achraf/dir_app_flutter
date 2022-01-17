import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:plant_app/providers/see_all_businesses_provider.dart';
import 'package:plant_app/providers/search_provider.dart';
import 'package:plant_app/providers/see_all_events_provider.dart';
import 'package:plant_app/providers/see_all_promotions_provider.dart';
import 'package:plant_app/screens/search/components/business_search_card.dart';
import 'package:plant_app/screens/search/components/event_search_card.dart';
import 'package:plant_app/screens/search/components/promotion_search_card.dart';
import 'package:plant_app/screens/search/see_all_businesses.dart';
import 'package:plant_app/screens/search/see_all_events.dart';
import 'package:plant_app/screens/search/seel_all_promotions.dart';
import 'package:provider/provider.dart';

class searchAllResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchProvider searchProvider =
        Provider.of<SearchProvider>(context, listen: true);

    List<Widget> sections = [];

    if (searchProvider.totalPromotions > 0) {
      List<Promotion> promotions = searchProvider.promotions;
      sections.add(
        Column(
          children: [
            sectionHeader(
                title: 'Promotions',
                totalResults: searchProvider.totalPromotions,
                seeAllScreen: SeeAllPromotions()),
            PromotionSearchCard(promotion: promotions[0]),
          ],
        ),
      );
    }

    if (searchProvider.totalEvents > 0) {
      List<Event> events = searchProvider.events;
      sections.add(
        Column(
          children: [
            sectionHeader(
                title: 'Events',
                totalResults: searchProvider.totalEvents,
                seeAllScreen: SeeAllEvents()),
            EventSearchCard(event: events[0]),
          ],
        ),
      );
    }

    if (searchProvider.totalBusinesses > 0) {
      List<Business> businesses = searchProvider.businesses;
      Column businessesList = Column(children: []);

      // Add all businesses to businesses list
      businesses.forEach(
        (business) {
          businessesList.children.add(BusinessSearchCard(business: business));
        },
      );

      sections.add(
        Column(
          children: [
            sectionHeader(
              title: 'Businesses',
              totalResults: searchProvider.totalBusinesses,
              seeAllScreen: SeeAllBusinesses(),
            ),
            businessesList,
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ListView(children: sections),
    );
  }
}

class sectionHeader extends StatelessWidget {
  final String title;
  final int totalResults;
  final Widget seeAllScreen;

  const sectionHeader({
    Key key,
    @required this.title,
    @required this.totalResults,
    @required this.seeAllScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // get the search key as it's gonna be needed for 'See All'
    final String searchQuery =
        Provider.of<SearchProvider>(context, listen: false).searchQuery;

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          TextButton(
              onPressed: () {
                if (title == 'Promotions')
                  Provider.of<SeeAllPromotionsProvider>(context, listen: false)
                      .seeAllPromotions(searchQuery: searchQuery);
                else if (title == 'Events') {
                  Provider.of<SeeAllEventsProvider>(context, listen: false)
                      .seeAllEvents(searchQuery: searchQuery);
                } else if (title == 'Businesses') {
                  Provider.of<SeeAllBusinessesProvider>(context, listen: false)
                      .seeAllBusinesses(searchQuery: searchQuery);
                }

                showModalBottomSheet(
                  barrierColor: kBackgroundColor,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Scaffold(
                        appBar: AppBar(
                          leading: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back_ios),
                            color: kPrimaryColor,
                          ),
                          centerTitle: true,
                          title: Text(
                            title,
                            style: TextStyle(color: kTextColor),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        // body: Container(child: seeAllScreen),
                        body: seeAllScreen,
                      ),
                    );
                  },
                );
              },
              child: Text(
                'See All ($totalResults)',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
