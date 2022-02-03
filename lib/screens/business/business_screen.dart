import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:plant_app/screens/business/components/add_review_screen.dart';
import 'package:plant_app/screens/business/components/business_info.dart';
import 'package:plant_app/screens/business/components/business_reviews.dart';
import 'package:plant_app/screens/business/components/business_sliver_app_bar.dart';
import 'package:plant_app/screens/business/components/business_photos.dart';
import 'package:plant_app/screens/business/delegates/sliver_persistent_header_delegate_impl.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

class BusinessScreen extends StatefulWidget {
  final int businessId;
  BusinessScreen({@required this.businessId});

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen>
    with SingleTickerProviderStateMixin {
  User user;
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() => setState(() {}));

    user = Provider.of<Auth>(context, listen: false).user;

    Provider.of<BusinessProvider>(context, listen: false)
        .fetchBusiness(businessId: widget.businessId);

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Business business =
        Provider.of<BusinessProvider>(context, listen: true).business;

    if (business == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor,
          ),
        ),
      );
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            BusinessSliverAppBar(
              name: business.name,
              coverImgPath: business.coverImgPath,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverPersistentHeaderDelegateImpl(
                tabBar: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.black,
                  controller: tabController,
                  tabs: [
                    Tab(text: 'Info'),
                    Tab(text: 'Photos'),
                    Tab(text: 'Reviews'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            BusinessInfo(
              business: business,
            ),
            BusinessPhotos(
              business: business,
            ),
            BusinessReviews(
              business: business,
              user: user,
            ),
          ],
        ),
      ),
      floatingActionButton: business.reviewedByUser || tabController.index != 2
          ? null // if already reviewed or different tab, don't show floatingActionButton
          : FloatingActionButton.extended(
              icon: const Icon(Icons.rate_review),
              label: const Text('Write a review'),
              backgroundColor: kPrimaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddReviewScreen(
                      business: business,
                      user: user,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
