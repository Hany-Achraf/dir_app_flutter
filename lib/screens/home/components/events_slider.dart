import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:plant_app/screens/event/event_screen.dart';
import 'package:plant_app/screens/events/events_screen.dart';
import 'package:plant_app/screens/promotions/promotions_screen.dart';
import 'package:plant_app/services/dio.dart';

import '../../../constants.dart';

class EventsSlider extends StatelessWidget {
  final List<Event> events = [];

  final dynamic eventsJson;
  EventsSlider({@required this.eventsJson});

  void setEvents() {
    eventsJson.forEach((i) {
      events.add(Event.fromJson(i));
    });
  }

  Widget buildEventsSlider() {
    Row eventsSlider = Row(children: []);
    events.forEach((event) {
      eventsSlider.children.add(
        EventCard(
          event: event,
        ),
      );
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: eventsSlider,
    );
  }

  @override
  Widget build(BuildContext context) {
    setEvents();
    return buildEventsSlider();
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventScreen(
              event: event,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding,
        ),
        width: size.width * 0.8,
        height: 150,
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
              // child: Image.network(
              //   event.imgUrl,
              //   fit: BoxFit.fill,
              //   width: 120,
              //   height: 150,
              // ),
              child: Image.network(
                '${dio().options.baseUrl}${event.imgPath}',
                fit: BoxFit.fill,
                width: 120,
                height: 150,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              width: size.width * 0.8 - 140,
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
