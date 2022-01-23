import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:plant_app/providers/promotions_provider.dart';
import 'package:plant_app/screens/promotion/promotion_screen.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool gotMoreToLoad = true;

  CarouselController buttonCarouselController = CarouselController();

  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i));
    }
    return result;
  }

  @override
  void initState() {
    Provider.of<PromotionsProvider>(context, listen: false)
        .loadInitialPromotions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Promotion> promotions =
        Provider.of<PromotionsProvider>(context, listen: true).promotions;

    if (promotions == null)
      return Center(child: CircularProgressIndicator(color: kPrimaryColor));

    if (promotions.isEmpty)
      return Center(
        child: Text(
          'No Data to Show!',
          style: TextStyle(color: kPrimaryColor, fontSize: 20),
        ),
      );

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
                height: MediaQuery.of(context).size.height / 1.2,
                initialPage: 0,
                enlargeCenterPage: true,
                // autoPlay: true,
                reverse: false,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) async {
                  _current = index;
                  if (gotMoreToLoad && _current == (promotions.length - 2)) {
                    gotMoreToLoad = await Provider.of<PromotionsProvider>(
                            context,
                            listen: false)
                        .loadMorePromotions();
                  }
                  setState(() {});
                },
              ),
              items: map<Widget>(promotions, (index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: _current == index
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PromotionScreen(
                                      promotion: promotions[index],
                                    ),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    // width: size.width,
                                    width: MediaQuery.of(context).size.width,
                                    // height: 390,
                                    height: MediaQuery.of(context).size.height /
                                        1.6,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kTextLightColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: Image.network(
                                          '$api/image?path=${promotions[index].imgPath}',
                                          headers: {'Connection': 'Keep-Alive'},
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
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
                                          maxLines: 2,
                                          text: TextSpan(
                                            text: promotions[index].name,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: RichText(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                text: TextSpan(
                                                  text: promotions[index]
                                                      .provider
                                                      .name,
                                                  style: TextStyle(
                                                    color: kTextColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Untill ${DateFormat("dd MMM yyyy").format(promotions[index].endDate)}',
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
                              ),
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
                                  '$api/image?path=${promotions[index].imgPath}',
                                  headers: {'Connection': 'Keep-Alive'},
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
        ],
      ),
    );
  }
}
