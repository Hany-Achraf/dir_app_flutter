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

class WishlistScreen extends StatefulWidget {
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  Future<bool> initialBusinessesLoaded;
  @override
  void initState() {
    final User user = Provider.of<Auth>(context, listen: false).user;

    initialBusinessesLoaded =
        Provider.of<BusinessesProvider>(context, listen: false)
            .loadInitialBusinesses(userId: user.id);

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
        body: FutureBuilder(
          future: initialBusinessesLoaded,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: businesses.length,
                itemBuilder: (context, index) {
                  return WishlistBusinessCard(business: businesses[index]);
                },
              );
            }
            return Center(
                child: CircularProgressIndicator(color: kPrimaryColor));
          },
        ),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }
}
