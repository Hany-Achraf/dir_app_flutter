// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:plant_app/constants.dart';

// class PromotionsScreen extends StatefulWidget {
//   final bool autoplay;
//   const PromotionsScreen({Key key, this.autoplay}) : super(key: key);

//   @override
//   _PromotionsScreenState createState() => _PromotionsScreenState();
// }

// class _PromotionsScreenState extends State<PromotionsScreen> {
//   //
//   CarouselController buttonCarouselController = CarouselController();
//   int _current = 0;
//   List imgList = [
//     'https://savorsunsets.com/wp-content/uploads/2019/04/IMG_1891.jpg',
//     'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
//     'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
//   ];

//   List<T> map<T>(List list, Function handler) {
//     List<T> result = [];
//     for (var i = 0; i < list.length; i++) {
//       result.add(handler(i, list[i]));
//     }
//     return result;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Promotions'),
//       ),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             CarouselSlider(
//               carouselController: buttonCarouselController,
//               options: CarouselOptions(
//                 height: 400.0,
//                 initialPage: 0,
//                 enlargeCenterPage: true,
//                 autoPlay: widget.autoplay,
//                 reverse: false,
//                 enableInfiniteScroll: true,
//                 autoPlayInterval: Duration(seconds: 2),
//                 autoPlayAnimationDuration: Duration(milliseconds: 2000),
//                 pauseAutoPlayOnTouch: true,
//                 scrollDirection: Axis.horizontal,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     _current = index;
//                   });
//                 },
//               ),
//               items: imgList.map((imgUrl) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 10.0),
//                       decoration: BoxDecoration(
//                         color: kTextLightColor,
//                       ),
//                       child: Image.network(
//                         imgUrl,
//                         fit: BoxFit.fill,
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: map<Widget>(imgList, (index, url) {
//                 return Container(
//                   width: 10.0,
//                   height: 10.0,
//                   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: _current == index ? kPrimaryColor : kTextLightColor,
//                   ),
//                 );
//               }),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 OutlineButton(
//                   onPressed: goToPrevious,
//                   child: Text("<"),
//                 ),
//                 OutlineButton(
//                   onPressed: goToNext,
//                   child: Text(">"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void goToPrevious() {
//     buttonCarouselController.previousPage(
//         duration: Duration(milliseconds: 300), curve: Curves.ease);
//   }

//   void goToNext() {
//     buttonCarouselController.nextPage(
//         duration: Duration(milliseconds: 300), curve: Curves.decelerate);
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:plant_app/constants.dart';

class PromotionsScreen extends StatefulWidget {
  final bool autoplay;
  const PromotionsScreen({Key key, this.autoplay}) : super(key: key);

  @override
  _PromotionsScreenState createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  //
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
        title: Text('Promotions'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12.0),
        // margin: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: 500.0,
                  initialPage: 0,
                  // enlargeCenterPage: true,
                  // autoPlay: widget.autoplay,
                  autoPlay: false,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: imgList.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      // return Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   margin: EdgeInsets.symmetric(horizontal: 10.0),
                      //   decoration: BoxDecoration(
                      //     color: kTextLightColor,
                      //   ),
                      //   child: Image.network(
                      //     imgUrl,
                      //     fit: BoxFit.fill,
                      //   ),
                      // );

                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: kTextLightColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
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
                            Container(
                              padding: EdgeInsets.all(kDefaultPadding / 2),
                              // padding: EdgeInsets.fromLTRB(kDefaultPadding / 2,
                              //     kDefaultPadding / 2, kDefaultPadding / 2, 0),
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
                                            text:
                                                "Hany Mohamed\n".toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .button,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );

                      // return Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 8.0),
                      //   width: size.width,
                      //   child: Column(
                      //     children: <Widget>[
                      //       ClipRRect(
                      //         borderRadius: BorderRadius.only(
                      //           topLeft: Radius.circular(10),
                      //           topRight: Radius.circular(10),
                      //         ),
                      //         child: Image.network(
                      //           imgUrl,
                      //           fit: BoxFit.fill,
                      //           width: size.width,
                      //           height: 400,
                      //         ),
                      //       ),
                      //       Container(
                      //         padding: EdgeInsets.all(kDefaultPadding / 2),
                      //         // padding: EdgeInsets.fromLTRB(kDefaultPadding / 2,
                      //         //     kDefaultPadding / 2, kDefaultPadding / 2, 0),
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.only(
                      //             bottomLeft: Radius.circular(10),
                      //             bottomRight: Radius.circular(10),
                      //           ),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               offset: Offset(0, 5),
                      //               blurRadius: 5,
                      //               color: kPrimaryColor.withOpacity(0.23),
                      //             ),
                      //           ],
                      //         ),
                      //         child: Row(
                      //           children: <Widget>[
                      //             Flexible(
                      //               child: RichText(
                      //                 overflow: TextOverflow.ellipsis,
                      //                 text: TextSpan(
                      //                   children: [
                      //                     TextSpan(
                      //                       text:
                      //                           "Hany Mohamed\n".toUpperCase(),
                      //                       style: Theme.of(context)
                      //                           .textTheme
                      //                           .button,
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // );
                    },
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? kPrimaryColor : kTextLightColor,
                  ),
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: goToPrevious,
                  child: Text("<"),
                ),
                OutlineButton(
                  onPressed: goToNext,
                  child: Text(">"),
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






























// Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.only(
//         left: kDefaultPadding,
//         top: kDefaultPadding / 2,
//         // bottom: kDefaultPadding * 2.5,
//         bottom: kDefaultPadding,
//       ),
//       width: size.width * 0.4,
//       child: GestureDetector(
//         onTap: press,
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 150,
//               width: 200,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   topRight: Radius.circular(10),
//                 ),
//                 child: Image.asset(
//                   image,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(kDefaultPadding / 2),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 5),
//                     blurRadius: 5,
//                     color: kPrimaryColor.withOpacity(0.23),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Flexible(
//                     child: RichText(
//                       overflow: TextOverflow.ellipsis,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                               text: "$name\n".toUpperCase(),
//                               style: Theme.of(context).textTheme.button),
//                           // TextSpan(
//                           //   text: "$description".toUpperCase(),
//                           //   style: TextStyle(
//                           //     color: kPrimaryColor.withOpacity(0.5),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // Spacer(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );