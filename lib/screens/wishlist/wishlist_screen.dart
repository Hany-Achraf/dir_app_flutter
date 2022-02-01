import 'package:flutter/material.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/providers/businesses_provider.dart';
import 'package:plant_app/providers/my_bottom_nav_provider.dart';
import 'package:plant_app/screens/wishlist/wishlist_business_card.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WishlistScreen extends StatefulWidget {
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    Provider.of<BusinessesProvider>(context, listen: false)
        .loadInitialBusinesses();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Business> businesses =
        Provider.of<BusinessesProvider>(context, listen: true).businesses;

    return WillPopScope(
      onWillPop: () async {
        Provider.of<BottomNavigatorProvider>(context, listen: false)
            .changeIndex(index: 0);
        Navigator.popUntil(
          context,
          (route) => route.isFirst,
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Wishlist'),
        ),
        body: businesses == null
            ? Center(child: CircularProgressIndicator(color: kPrimaryColor))
            : businesses.isEmpty
                ? Center(
                    child: Text(
                      'No Data to Show!',
                      style: TextStyle(color: kPrimaryColor, fontSize: 20),
                    ),
                  )
                : SmartRefresher(
                    controller: refreshController,
                    enablePullDown: false,
                    enablePullUp: true,
                    onLoading: () async {
                      // load more, and return true if there is more to load and vice versa
                      bool gotMoreToLoad =
                          await Provider.of<BusinessesProvider>(context,
                                  listen: false)
                              .loadMoreBusinesses();

                      // if no more to load exeute the laodNoData() method on refreshController
                      if (!gotMoreToLoad) {
                        refreshController.loadNoData();
                      } else {
                        refreshController.loadComplete();
                      }
                    },
                    child: ListView.builder(
                      itemCount: businesses.length,
                      itemBuilder: (context, index) {
                        return WishlistBusinessCard(
                            business: businesses[index]);
                      },
                    ),
                  ),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
