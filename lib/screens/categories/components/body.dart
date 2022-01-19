import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/category_model.dart';
import 'package:plant_app/providers/categories_provider.dart';
import 'package:plant_app/screens/category/category_screen.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'category_card.dart';

class Body extends StatelessWidget {
  final refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    // final refreshController = RefreshController();
    final List<Category> categories =
        Provider.of<CategoriesProvider>(context, listen: true).categories;

    if (categories == null) {
      return Center(child: CircularProgressIndicator(color: kPrimaryColor));
    }

    if (categories.isEmpty) {
      return Center(
        child: Text(
          'No Data to Show!',
          style: TextStyle(color: kPrimaryColor, fontSize: 20),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text(
            'Categories',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: SmartRefresher(
              controller: refreshController,
              enablePullDown: false,
              enablePullUp: true,
              onLoading: () async {
                // load more, and return true if there is more to load and vice versa
                bool gotMoreToLoad = await Provider.of<CategoriesProvider>(
                        context,
                        listen: false)
                    .loadMoreCategories();

                // if no more to load exeute the laodNoData() method on refreshController
                if (!gotMoreToLoad) {
                  refreshController.loadNoData();
                } else {
                  refreshController.loadComplete();
                }
              },
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => CategoryCard(
                  category: categories[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryScreen(category: categories[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
