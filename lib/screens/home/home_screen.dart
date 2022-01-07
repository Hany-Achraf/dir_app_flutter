import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/screens/auth/loading_page.dart';
import 'package:plant_app/screens/auth/welcome_page.dart';
import 'package:plant_app/screens/home/components/body.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, auth, child) {
      if (auth.loading) {
        return Loading();
      }

      if (!auth.authenticated) {
        return WelcomePage();
      }

      return Scaffold(
        body: Body(),
        bottomNavigationBar: MyBottomNavBar(),
      );
    });
  }
}
