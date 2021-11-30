// import 'package:flutter/material.dart';
// import 'package:plant_app/constants.dart';
// import 'package:plant_app/models/Product.dart';
// import 'package:plant_app/models/activity_model.dart';
// import 'package:plant_app/models/destination_model.dart';
// import 'package:plant_app/screens/business/business_screen.dart';
// import 'package:plant_app/screens/category/components/sub_categories.dart';

// // import 'categories.dart';
// import 'business_card.dart';

// class Body extends StatefulWidget {
//   final Destination destination;

//   Body({this.destination});

//   @override
//   State<Body> createState() => _BodyState();
// }

// class _BodyState extends State<Body> {
//   Text _buildRatingStars(int rating) {
//     String stars = '';
//     for (int i = 0; i < rating; i++) {
//       stars += '⭐ ';
//     }
//     stars.trim();
//     return Text(stars);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Center(
//           child: Padding(
//             // padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//             padding: const EdgeInsets.all(kDefaultPadding),
//             child: Text(
//               "Fashion",
//               style: Theme.of(context)
//                   .textTheme
//                   .headline5
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         SubCategories(),
//         // Expanded(
//         //   child: Padding(
//         //     padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//         //     child: GridView.builder(
//         //         itemCount: products.length,
//         //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         //           crossAxisCount: 1,
//         //           mainAxisSpacing: kDefaultPadding,
//         //           crossAxisSpacing: kDefaultPadding,
//         //           childAspectRatio: 0.75,
//         //         ),
//         //         itemBuilder: (context, index) => CategoryCard(
//         //               product: products[index],
//         //               press: () {},
//         //             )),
//         //   ),
//         // ),
//         Expanded(
//           child: ListView.builder(
//             padding: EdgeInsets.only(bottom: 15.0),
//             itemCount: widget.destination.activities.length,
//             itemBuilder: (BuildContext context, int index) {
//               Activity activity = widget.destination.activities[index];
//               return Stack(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
//                     height: 170.0,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: Card(
//                       elevation: 1.5,
//                       child: Padding(
//                         padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Container(
//                                   width: 120.0,
//                                   child: Text(
//                                     activity.name,
//                                     style: TextStyle(
//                                       fontSize: 18.0,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Text(
//                               activity.type,
//                               style: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             _buildRatingStars(activity.rating),
//                             SizedBox(height: 10.0),
//                             Row(
//                               children: <Widget>[
//                                 Container(
//                                   padding: EdgeInsets.all(5.0),
//                                   width: 70.0,
//                                   decoration: BoxDecoration(
//                                     color: Theme.of(context).accentColor,
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     activity.startTimes[0],
//                                   ),
//                                 ),
//                                 SizedBox(width: 10.0),
//                                 Container(
//                                   padding: EdgeInsets.all(5.0),
//                                   width: 70.0,
//                                   decoration: BoxDecoration(
//                                     color: Theme.of(context).accentColor,
//                                     borderRadius: BorderRadius.circular(10.0),
//                                   ),
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     activity.startTimes[1],
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 20.0,
//                     top: 15.0,
//                     bottom: 15.0,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20.0),
//                       child: Image.asset(
//                         activity.imageUrl,
//                         width: 110.0,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/Product.dart';
import 'package:plant_app/models/activity_model.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/business/business_screen.dart';
import 'package:plant_app/screens/category/components/sub_categories.dart';

// import 'categories.dart';
import 'business_card.dart';

class Body extends StatefulWidget {
  final Destination destination;

  Body({this.destination});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Padding(
            // padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Text(
              "Sports",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SubCategories(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 15.0),
            itemCount: widget.destination.activities.length,
            itemBuilder: (BuildContext context, int index) {
              Activity activity = widget.destination.activities[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BusinessScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  height: 170.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: Colors.green,
                    elevation: 1.5,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                activity.imageUrl,
                                height: 200,
                                width: 110.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    child: Text(
                                      activity.name,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                activity.type,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              _buildRatingStars(activity.rating),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      activity.startTimes[0],
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    width: 70.0,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      activity.startTimes[1],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
              // Positioned(
              //   left: 20.0,
              //   top: 15.0,
              //   bottom: 15.0,
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(20.0),
              //   child: Image.asset(
              //     activity.imageUrl,
              //     width: 110.0,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              // ),
            },
          ),
        ),
      ],
    );
  }
}
