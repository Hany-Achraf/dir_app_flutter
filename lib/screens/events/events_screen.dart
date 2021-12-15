import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/category_model.dart';

class EventsScreen extends StatefulWidget {
  final bool autoplay;
  const EventsScreen({Key key, this.autoplay}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;
  List imgList = [
    'https://savorsunsets.com/wp-content/uploads/2019/04/IMG_1891.jpg',
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: 507.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: widget.autoplay,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 4),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: map<Widget>(imgList, (index, imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: _current == index
                            ? Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 390,
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
                                          imgUrl,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.all(kDefaultPadding / 2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 5),
                                          blurRadius: 5,
                                          color:
                                              kPrimaryColor.withOpacity(0.23),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                          text: TextSpan(
                                            // text: 'Promotion Title',
                                            text: dummyText,
                                            style: TextStyle(
                                              color: kTextColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 185,
                                              child: RichText(
                                                overflow: TextOverflow.ellipsis,
                                                text: TextSpan(
                                                  text: 'Business/Shop Name',
                                                  // text: dummyText,
                                                  style: TextStyle(
                                                    color: kTextColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Untill 31 Dec 2021',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: kTextLightColor,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    imgUrl,
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
            //   children: map<Widget>(imgList, (index, url) {
            //     return Container(
            //       width: 10.0,
            //       height: 10.0,
            //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: _current == index ? kPrimaryColor : kTextLightColor,
            //       ),
            //     );
            //   }),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: goToPrevious,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: kBackgroundColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: goToNext,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: kBackgroundColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void goToPrevious() {
    buttonCarouselController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void goToNext() {
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
