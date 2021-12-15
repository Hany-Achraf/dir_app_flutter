import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/screens/destination/destination_screen.dart';
import 'destination_card.dart';

class Body extends StatelessWidget {
  final Destination destination;

  const Body({
    this.destination,
  });

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
              itemBuilder: (context, index) => DestinationCard(
                destination: destination,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
