import 'package:flutter/material.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:plant_app/providers/see_all_promotions_provider.dart';
import 'package:plant_app/screens/search/components/promotion_search_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeeAllPromotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Promotion> promotions =
        Provider.of<SeeAllPromotionsProvider>(context, listen: true).promotions;

    RefreshController refreshController = RefreshController();
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false,
      enablePullUp: true,
      onLoading: () async {
        // load more, and return true if there is more to load and vice versa
        bool gotMorePromotionsToLoad =
            await Provider.of<SeeAllPromotionsProvider>(context, listen: false)
                .loadMorePromotions();

        // if no more to load exeute the laodNoData() method on refreshController
        if (!gotMorePromotionsToLoad) {
          refreshController.loadNoData();
        }
      },
      child: ListView.builder(
        itemCount: promotions.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.all(8.0),
                child: PromotionSearchCard(promotion: promotions[index])),
          );
        },
      ),
    );
  }
}
