import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/providers/destinations_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'destination_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final refreshController = RefreshController();
    final destinations =
        Provider.of<DestinationsProvider>(context, listen: true).destinations;

    if (destinations == null)
      return Center(child: CircularProgressIndicator(color: kPrimaryColor));

    if (destinations.isEmpty)
      return Center(
        child: Text(
          'No Data to Show!',
          style: TextStyle(color: kPrimaryColor, fontSize: 20),
        ),
      );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text(
            'Top Destinations',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SmartRefresher(
              controller: refreshController,
              enablePullDown: false,
              enablePullUp: true,
              onLoading: () async {
                // load more, and return true if there is more to load and vice versa
                bool gotMoreToLoad = await Provider.of<DestinationsProvider>(
                        context,
                        listen: false)
                    .loadMoreDestinations();

                // if no more to load exeute the laodNoData() method on refreshController
                if (!gotMoreToLoad) {
                  refreshController.loadNoData();
                } else {
                  refreshController.loadComplete();
                }
              },
              child: GridView.builder(
                itemCount: destinations.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing:
                      kDefaultPadding, // Chang may be considered here
                  crossAxisSpacing: kDefaultPadding,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => DestinationCard(
                  destination: destinations[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
