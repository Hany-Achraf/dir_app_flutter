import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/Product.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/category/category_screen.dart';
import 'package:plant_app/screens/top_destination/top_destination_screen.dart';

// import 'categories.dart';
import 'top_destination_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          // padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text(
            "Top Destinations",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        // Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: kDefaultPadding / 2,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => TopDestinationCard(
                image: "assets/images/mid-valley-jb.png",
                name: "Angelica",
                // description: "Russia",
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
            ),
          ),
        ),
      ],
    );
  }
}
