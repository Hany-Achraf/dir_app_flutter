import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/components/my_bottom_nav_bar.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/delegates/custom_search_delegate.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/providers/businesses_provider.dart';
import 'package:plant_app/screens/category/components/body.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  CategoryScreen({this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Future<bool> initialBusinessesLoaded;

  @override
  void initState() {
    initialBusinessesLoaded =
        Provider.of<BusinessesProvider>(context, listen: false)
            .loadInitialBusinesses(categoryId: widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      // body: FutureBuilder(
      //     future: initialBusinessesLoaded,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return Body(category: widget.category);
      //       }
      //       return Center(
      //           child: CircularProgressIndicator(color: kPrimaryColor));
      //     }),

      body: Body(category: widget.category),
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
