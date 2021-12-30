import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/providers/categories_provider.dart';
import 'package:plant_app/screens/categories/components/body.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Future<bool> initialCategoriesLoaded;

  @override
  void initState() {
    initialCategoriesLoaded =
        Provider.of<CategoriesProvider>(context, listen: false)
            .loadInitialCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder(
        future: initialCategoriesLoaded,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Body();
          }
          return Center(
              child: CircularProgressIndicator(
            color: kPrimaryColor,
          ));
        },
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        // icon: SvgPicture.asset(
        //   "assets/icons/back.svg",
        //   color: kPrimaryColor,
        // ),
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
          size: 30.0,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          // icon: SvgPicture.asset(
          //   "assets/icons/search.svg",
          //   color: kPrimaryColor,
          // ),
          icon: Icon(
            Icons.search,
            color: kPrimaryColor,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
