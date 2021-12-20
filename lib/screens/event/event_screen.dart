import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:readmore/readmore.dart';

class EventScreen extends StatelessWidget {
  final Event event;

  EventScreen({this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          customAppBar(context, imgUrl: event.imgUrl),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Text(
                                // 'Event Name',
                                event.name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                          ),
                          IconButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              alignment: Alignment.topRight,
                              icon: Icon(Icons.favorite_border,
                                  color: Colors.grey, size: 25)),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Text(
                              // 'Business Name',
                              event.organizer,
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          Text(
                            // 'On 24 Dec 2021',
                            // 'On ${DateFormat("dd MMM yyyy").format(event.date)}',
                            'On ${DateFormat("E, dd-MM-yyyy (hh:mm a)").format(event.date)}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        // width: 300,
                        child: ReadMoreText(
                          // 'Event Description',
                          event.description,
                          style: TextStyle(color: Colors.black),
                          trimLines: 3,
                          colorClickableText: kPrimaryColor,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

SliverAppBar customAppBar(BuildContext context, {String imgUrl}) {
  return SliverAppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () {
        Navigator.maybePop(context);
      },
    ),
    pinned: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.search,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    ],
    // expandedHeight: 400,
    expandedHeight: MediaQuery.of(context).size.height / 1.5,
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(children: [
        Positioned.fill(
          child: Image.network(
            imgUrl,
            fit: BoxFit.fill,
          ),
        ),
      ]),
    ),
  );
}
