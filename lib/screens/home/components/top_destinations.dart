import 'package:flutter/material.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/destination/destination_screen.dart';
import 'package:plant_app/screens/details/details_screen.dart';

import '../../../constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecomendPlantCard(
            image: "assets/images/mid-valley-jb.png",
            name: "Angelica",
            description: "Russia",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationScreen(
                    destination: destinations[0],
                  ),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/image_2.png",
            name: "Angelica",
            description: "Russia",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          RecomendPlantCard(
            image: "assets/images/image_3.png",
            name: "Samantha",
            description: "Russia",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard({
    Key key,
    this.image,
    this.name,
    this.description,
    this.press,
  }) : super(key: key);

  final String image, name, description;
  // final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        // bottom: kDefaultPadding * 2.5,
        bottom: kDefaultPadding,
      ),
      width: size.width * 0.4,
      child: GestureDetector(
        onTap: press,
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: 200,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "$name\n".toUpperCase(),
                              style: Theme.of(context).textTheme.button),
                          TextSpan(
                            text: "$description".toUpperCase(),
                            style: TextStyle(
                              color: kPrimaryColor.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Spacer(),
                  // Text(
                  //   '\$$price',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .button
                  //       .copyWith(color: kPrimaryColor),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
