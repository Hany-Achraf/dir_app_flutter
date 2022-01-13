import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/providers/my_bottom_nav_provider.dart';
import 'package:plant_app/screens/auth/loading_page.dart';
import 'package:plant_app/screens/auth/welcome_page.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';
// import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
// import 'package:shop_app/enums.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      child: Consumer<Auth>(
        builder: (context, auth, child) {
          if (auth.loading) {
            Provider.of<BottomNavigatorProvider>(context, listen: false)
                .changeIndex(index: 0);
            return Loading();
          }

          if (!auth.authenticated) {
            return WelcomePage();
          }

          return Scaffold(
            appBar: AppBar(
              leading: Container(),
              centerTitle: true,
              title: Text(
                '${auth.user.getFullName()}',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: kPrimaryColor,
              elevation: 1.5,
            ),
            body: Body(),
            // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
            bottomNavigationBar: MyBottomNavBar(),
          );
        },
      ),
    );
  }
}
