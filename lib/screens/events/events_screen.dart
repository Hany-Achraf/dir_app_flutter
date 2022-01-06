import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:plant_app/providers/events_provider.dart';
import 'package:plant_app/screens/event/event_screen.dart';
import 'package:plant_app/services/dio.dart';
import 'package:provider/provider.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i));
    }
    return result;
  }

  Future<bool> initialEventsLoaded;

  @override
  void initState() {
    initialEventsLoaded =
        Provider.of<EventsProvider>(context, listen: false).loadInitialEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.maybeOf(context).pop();
            }),
      ),
      body: FutureBuilder(
        future: initialEventsLoaded,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Event> events =
                Provider.of<EventsProvider>(context, listen: true).events;
            return Container(
              margin: EdgeInsets.only(top: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        // height: 507.0,
                        height: MediaQuery.of(context).size.height / 1.2,
                        initialPage: 0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        reverse: false,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 4),
                        autoPlayAnimationDuration: Duration(milliseconds: 2000),
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: map<Widget>(events, (index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              // width: size.width,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: _current == index
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EventScreen(
                                              event: events[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            // width: size.width,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // height: 390,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                1.6,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: kTextLightColor,
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                child: Image.network(
                                                  '${dio().options.baseUrl}${events[index].imgPath}',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: EdgeInsets.all(
                                                kDefaultPadding / 2),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(0, 5),
                                                  blurRadius: 5,
                                                  color: kPrimaryColor
                                                      .withOpacity(0.23),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  text: TextSpan(
                                                    text: events[index].name,
                                                    style: TextStyle(
                                                      color: kTextColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Container(
                                                  child: RichText(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    text: TextSpan(
                                                      text:
                                                          'Organized by: ${events[index].organizer}',
                                                      style: TextStyle(
                                                        color: kTextColor,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  'On ${DateFormat("E, dd-MM-yyyy (hh:mm a)").format(events[index].dateTime)}',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: kTextLightColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        child: Image.network(
                                          '${dio().options.baseUrl}${events[index].imgPath}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     GestureDetector(
                  //       onTap: goToPrevious,
                  //       child: Container(
                  //         width: 40,
                  //         height: 40,
                  //         decoration: BoxDecoration(
                  //           color: kPrimaryColor,
                  //           borderRadius: BorderRadiusDirectional.circular(20),
                  //         ),
                  //         child: Icon(
                  //           Icons.arrow_back,
                  //           color: kBackgroundColor,
                  //           size: 30,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 8,
                  //     ),
                  //     GestureDetector(
                  //       onTap: goToNext,
                  //       child: Container(
                  //         width: 40,
                  //         height: 40,
                  //         decoration: BoxDecoration(
                  //           color: kPrimaryColor,
                  //           borderRadius: BorderRadiusDirectional.circular(20),
                  //         ),
                  //         child: Icon(
                  //           Icons.arrow_forward,
                  //           color: kBackgroundColor,
                  //           size: 30,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
        },
      ),
    );
  }

  // void goToPrevious() {
  //   buttonCarouselController.previousPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.ease);
  // }

  // void goToNext() {
  //   buttonCarouselController.nextPage(
  //       duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  // }
}
