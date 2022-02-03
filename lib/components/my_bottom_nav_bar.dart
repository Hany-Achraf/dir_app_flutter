import 'package:flutter/material.dart';
import 'package:plant_app/providers/my_bottom_nav_provider.dart';
import 'package:plant_app/screens/profile/profile_screen.dart';
import 'package:plant_app/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int index = Provider.of<BottomNavigatorProvider>(context).index;

    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        // bottom: kDefaultPadding,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home,
                color: index == 0 ? kPrimaryColor : Colors.grey),
            onPressed: () {
              Provider.of<BottomNavigatorProvider>(context, listen: false)
                  .changeIndex(index: 0);
              Navigator.popUntil(
                context,
                (route) => route.isFirst,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite,
                color: index == 1 ? kPrimaryColor : Colors.grey),
            onPressed: () {
              Provider.of<BottomNavigatorProvider>(context, listen: false)
                  .changeIndex(index: 1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WishlistScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person,
                color: index == 2 ? kPrimaryColor : Colors.grey),
            onPressed: () {
              Provider.of<BottomNavigatorProvider>(context, listen: false)
                  .changeIndex(index: 2);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
