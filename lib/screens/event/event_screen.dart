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
          customAppBar(context, imgPath: event.imgPath),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Organized by: ${event.organizer}',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'On ${DateFormat("E, dd-MM-yyyy (hh:mm a)").format(event.dateTime)}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ReadMoreText(
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

SliverAppBar customAppBar(BuildContext context, {String imgPath}) {
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
    expandedHeight: MediaQuery.of(context).size.height / 1.5,
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(children: [
        Positioned.fill(
          child: Image.network(
            '${api}/image?path=${imgPath}',
            headers: {'Connection': 'keep-alive'},
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.image,
              color: Colors.grey,
            ),
          ),
        ),
      ]),
    ),
  );
}
