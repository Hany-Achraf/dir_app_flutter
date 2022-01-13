import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:plant_app/providers/search_provider.dart';
import 'package:provider/provider.dart';

Container searchAllResults({@required BuildContext context}) {
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
              seeAllScreen: Container()),
          PromotionCard(promotion: promotions[0]),
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
              seeAllScreen: Container()),
          EventCard(event: events[0]),
        ],
      ),
    );
  }

  if (searchProvider.totalBusinesses > 0) {
    List<Business> businesses = searchProvider.businesses;
    sections.add(
      Column(
        children: [
          sectionHeader(
            title: 'Businesses',
            totalResults: searchProvider.totalBusinesses,
            seeAllScreen: Container(),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: businesses.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: ListTile(
                  leading:
                      Image.network('$url/${businesses[index].iconImgPath}'),
                  title: Text(businesses[index].name),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  return Container(
    margin: const EdgeInsets.all(8.0),
    child: ListView(children: sections),
  );
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
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          TextButton(
              onPressed: () {
                showModalBottomSheet(
                  barrierColor: kBackgroundColor,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Scaffold(
                        appBar: AppBar(
                          centerTitle: true,
                          title: Text(
                            'Title',
                            style: TextStyle(color: kTextColor),
                          ),
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        body: Container(
                          color: Colors.blue.shade100,
                          child: ListView.builder(
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.orange.shade100,
                                    ),
                                  ),
                                  title: Text('Title'),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                );
                              }),
                        ),
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

class PromotionCard extends StatelessWidget {
  final Promotion promotion;

  PromotionCard({
    this.promotion,
  });

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.9;
    final double _height = MediaQuery.of(context).size.height * 0.22;

    return InkWell(
      onTap: () {},
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 5,
              color: kPrimaryColor.withOpacity(0.23),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.network(
                '$url/${promotion.imgPath}',
                fit: BoxFit.fill,
                width: _width * 0.32,
                height: _height,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width * 0.9 - 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: promotion.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: promotion.provider.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text:
                            'Untill ${DateFormat("dd MMM yyyy").format(promotion.endDate)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.9;
    final double _height = MediaQuery.of(context).size.height * 0.22;

    return InkWell(
      onTap: () {},
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 5,
              color: kPrimaryColor.withOpacity(0.23),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.network(
                '$url/${event.imgPath}',
                fit: BoxFit.fill,
                width: _width * 0.32,
                height: _height,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width * 0.9 - 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: event.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: event.organizer,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text:
                            '${DateFormat("E, dd-MM-yyyy (hh:mm a)").format(event.dateTime)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
