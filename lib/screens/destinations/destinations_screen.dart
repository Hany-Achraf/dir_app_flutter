import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/delegates/custom_search_delegate.dart';
import 'package:plant_app/providers/destinations_provider.dart';
import 'package:plant_app/screens/destinations/components/body.dart';
import 'package:provider/provider.dart';

class DestinationsScreen extends StatefulWidget {
  @override
  State<DestinationsScreen> createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
  Future<bool> initialDestinationsLoaded;

  @override
  void initState() {
    initialDestinationsLoaded =
        Provider.of<DestinationsProvider>(context, listen: false)
            .loadInitialDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder(
        future: initialDestinationsLoaded,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Body();
          }
          return Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          );
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
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
          size: 30.0,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: kPrimaryColor,
            size: 30.0,
          ),
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
