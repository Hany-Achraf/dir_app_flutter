import 'package:flutter/material.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/business/business_screen.dart';

import '../../constants.dart';

class DestinationScreen extends StatefulWidget {
  final int destinationId;

  DestinationScreen({this.destinationId});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  Row _buildRatingStars(int rating) {
    List<Icon> ratingStars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating)
        ratingStars.add(Icon(Icons.star, color: Colors.yellow));
      else
        ratingStars.add(Icon(Icons.star, color: Colors.grey.shade300));
    }
    return Row(
      children: ratingStars,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Destination destination = destinations
        .firstWhere((destination) => destination.id == widget.destinationId);
    final List<Business> _businesses = businesses;

    // return Scaffold(
    //   body: Column(
    //     children: <Widget>[
    //       Stack(
    //         children: <Widget>[
    //           Container(
    //             height: size.width,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(30.0),
    //               boxShadow: [
    //                 BoxShadow(
    //                   color: Colors.black26,
    //                   offset: Offset(0.0, 2.0),
    //                   blurRadius: 6.0,
    //                 ),
    //               ],
    //             ),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.only(
    //                 bottomRight: Radius.circular(20),
    //                 bottomLeft: Radius.circular(20),
    //               ),
    //               child: Image.asset(
    //                 destination.imgUrl,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: <Widget>[
    //                 IconButton(
    //                   icon: Icon(Icons.arrow_back),
    //                   iconSize: 35.0,
    //                   color: Colors.black,
    //                   onPressed: () => Navigator.pop(context),
    //                 ),
    //                 Row(
    //                   children: <Widget>[
    //                     IconButton(
    //                       icon: Icon(Icons.search),
    //                       iconSize: 35.0,
    //                       color: Colors.black,
    //                       onPressed: () => Navigator.pop(context),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Positioned(
    //             left: 20.0,
    //             bottom: 20.0,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Text(
    //                   destination.name,
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 20.0,
    //                     fontWeight: FontWeight.w600,
    //                     letterSpacing: 1.2,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Positioned(
    //             right: 20.0,
    //             bottom: 20.0,
    //             child: Icon(
    //               Icons.location_on,
    //               color: Colors.white70,
    //               size: 25.0,
    //             ),
    //           ),
    //         ],
    //       ),
    //       Expanded(
    //         child: ListView.builder(
    //           padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
    //           itemCount: _businesses.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             Business business = _businesses[index];
    //             return InkWell(
    //               onTap: () {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(builder: (context) => BusinessScreen()),
    //                 );
    //               },
    //               child: Container(
    //                 margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
    //                 height: 170.0,
    //                 // width: double.infinity,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20.0),
    //                 ),
    //                 child: Card(
    //                   elevation: 1.5,
    //                   child: Padding(
    //                     // padding: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
    //                     padding: EdgeInsets.all(0),
    //                     child: Row(
    //                       // crossAxisAlignment: CrossAxisAlignment.end,
    //                       children: [
    //                         Container(
    //                           decoration: BoxDecoration(
    //                             color: Colors.orange,
    //                           ),
    //                           padding: EdgeInsets.only(left: 8.0, right: 8.0),
    //                           // width: size.width * 0.25,
    //                           child: ClipRRect(
    //                             borderRadius: BorderRadius.circular(20.0),
    //                             child: Image.asset(
    //                               business.thumbnailUrl,
    //                               height: 200,
    //                               // width: 110.0,
    //                               width: size.width * 0.25,
    //                               fit: BoxFit.fill,
    //                             ),
    //                           ),
    //                         ),
    //                         Column(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: <Widget>[
    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: <Widget>[
    //                                 Container(
    //                                   // width: 120.0,
    //                                   child: Text(
    //                                     business.name,
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
    //                             _buildRatingStars(business.rating),
    //                             SizedBox(height: 10.0),
    //                             Row(
    //                               children: <Widget>[
    //                                 Container(
    //                                   padding: EdgeInsets.all(5.0),
    //                                   width: 190.0,
    //                                   decoration: BoxDecoration(
    //                                     color: kPrimaryColor,
    //                                     borderRadius:
    //                                         BorderRadius.circular(10.0),
    //                                   ),
    //                                   alignment: Alignment.center,
    //                                   child: Text(business.workingTime),
    //                                 ),
    //                               ],
    //                             )
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            customAppBar(context,
                imgUrl: destination.imgUrl, destinationName: destination.name),
          ];
        },
        body: ListView.builder(
          padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
          // itemCount: _businesses.length,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            Business business = _businesses[index];
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
                // width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Card(
                  elevation: 1.5,
                  child: Padding(
                    // padding: EdgeInsets.fromLTRB(10.0, 20.0, 20.0, 20.0),
                    padding: EdgeInsets.all(0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.orange,
                          ),
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          // width: size.width * 0.25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              business.thumbnailUrl,
                              height: 200,
                              // width: 110.0,
                              width: MediaQuery.of(context).size.width * 0.25,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  // width: 120.0,
                                  child: Text(
                                    business.name,
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
                            _buildRatingStars(business.rating),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 190.0,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(business.workingTime),
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
          },
        ),
      ),
    );
  }
}

SliverAppBar customAppBar(BuildContext context,
    {String imgUrl, String destinationName}) {
  return SliverAppBar(
    title: Text(
      destinationName,
    ),
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
    expandedHeight: MediaQuery.of(context).size.height / 1.8,
    flexibleSpace: FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.asset(
            imgUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
  );
}
