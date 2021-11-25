import 'package:flutter/material.dart';

import '../../../constants.dart';

// We need satefull widget for our categories

class SubCategories extends StatefulWidget {
  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  List<String> subCategories = [
    "All",
    "Jewellery",
    "Footwear",
    "Dresses",
    "Hand bag",
    'ppppppp'
  ];
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      padding: const EdgeInsets.only(top: 0, bottom: kDefaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subCategories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              subCategories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
        //   child: GestureDetector(
        //     onTap: () {},
        //     child: Container(
        //       decoration: BoxDecoration(
        //         color: selectedIndex == index
        //             ? Theme.of(context).dividerColor
        //             // ? kBackgroundColor
        //             : Color(0xFFE7EBEE),
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Text(
        //           subCategories[index],
        //           style: TextStyle(fontSize: 12, color: Colors.white),
        //           // color: selectedIndex == index
        //           //     ? Theme.of(context).primaryColor
        //           //     : Color(0xFFB4C1C4),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
