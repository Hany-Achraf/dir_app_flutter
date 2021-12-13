import 'package:flutter/material.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/top_destination/top_destination_screen.dart';
import 'package:plant_app/screens/details/details_screen.dart';

import '../../../constants.dart';

// class TopDestinations extends StatelessWidget {
//   const TopDestinations({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: <Widget>[
//           TopDestinationCard(
//             image: "assets/images/mid-valley-jb.png",
//             name: "Angelica",
//             // description: "Russia",
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DestinationScreen(
//                     destination: destinations[0],
//                   ),
//                 ),
//               );
//             },
//           ),
//           TopDestinationCard(
//             image: "assets/images/mid-valley-jb.png",
//             name: "Angelica",
//             // description: "Russia",
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DestinationScreen(
//                     destination: destinations[0],
//                   ),
//                 ),
//               );
//             },
//           ),
//           TopDestinationCard(
//             image: "assets/images/mid-valley-jb.png",
//             name: "Angelica",
//             // description: "Russia",
//             press: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DestinationScreen(
//                     destination: destinations[0],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

class TopDestinationCard extends StatelessWidget {
  const TopDestinationCard({
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
        // top: kDefaultPadding / 2,
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
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
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
                    offset: Offset(0, 5),
                    blurRadius: 5,
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
                          // TextSpan(
                          //   text: "$description".toUpperCase(),
                          //   style: TextStyle(
                          //     color: kPrimaryColor.withOpacity(0.5),
                          //   ),
                          // ),
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
