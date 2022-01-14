import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:plant_app/providers/see_all_promotions_provider.dart';
import 'package:plant_app/screens/promotion/promotion_screen.dart';
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
                child: PromotionCard(promotion: promotions[index])),
          );
        },
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final Promotion promotion;

  PromotionCard({this.promotion});

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width * 0.9;
    final double _height = MediaQuery.of(context).size.height * 0.22;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PromotionScreen(promotion: promotion),
          ),
        );
      },
      child: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.network(
                '$url/${promotion.imgPath}',
                fit: BoxFit.fill,
                width: _width * 0.32,
                height: _height,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              margin: EdgeInsets.only(left: _width * 0.01),
              width: _width * 0.73,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: promotion.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: promotion.provider.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  // Spacer(),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text:
                            'Untill ${DateFormat("dd MMM yyyy").format(promotion.endDate)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
