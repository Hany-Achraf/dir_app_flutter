import 'package:flutter/material.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/providers/see_all_businesses_provider.dart';
import 'package:plant_app/screens/search/components/business_search_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeeAllBusinesses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Business> businesses =
        Provider.of<SeeAllBusinessesProvider>(context, listen: true).businesses;

    RefreshController refreshController = RefreshController();
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false,
      enablePullUp: true,
      onLoading: () async {
        // load more, and return true if there is more to load and vice versa
        bool gotMoreBusinessesToLoad =
            await Provider.of<SeeAllBusinessesProvider>(context, listen: false)
                .loadMoreBusinesses();

        // if no more to load exeute the laodNoData() method on refreshController
        if (!gotMoreBusinessesToLoad) {
          refreshController.loadNoData();
        }
      },
      child: ListView.builder(
        itemCount: businesses.length,
        itemBuilder: (context, index) {
          return BusinessSearchCard(business: businesses[index]);
        },
      ),
    );
  }
}
