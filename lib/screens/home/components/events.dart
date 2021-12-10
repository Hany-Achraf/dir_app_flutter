import 'package:flutter/material.dart';
import 'package:plant_app/screens/events/events_screen.dart';
import 'package:plant_app/screens/promotions/promotions_screen.dart';

import '../../../constants.dart';

class Events extends StatelessWidget {
  const Events({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          EventCard(
            image: "assets/images/bottom_img_1.png",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventsScreen(
                    autoplay: false,
                  ),
                ),
              );
            },
            text: 'Everyday Parenting: The ABCs of Child Rearing',
          ),
          EventCard(
            image: "assets/images/bottom_img_2.png",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventsScreen(
                    autoplay: false,
                  ),
                ),
              );
            },
            text: 'Hany Mohamed',
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key key,
    this.image,
    this.press,
    this.text,
  }) : super(key: key);
  final String image;
  final Function press;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
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
              child: Image.network(
                'https://savorsunsets.com/wp-content/uploads/2019/04/IMG_1891.jpg',
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
                        text: text,
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
                        text: text,
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
                        text: 'On 31 Dec 2021',
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
