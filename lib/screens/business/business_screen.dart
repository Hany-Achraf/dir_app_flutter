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
import 'package:tuple/tuple.dart';

class BusinessScreen extends StatefulWidget {
  int businessId;
  BusinessScreen({@required this.businessId});

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen>
    with SingleTickerProviderStateMixin {
  final List<Tuple3> _pages = [
    Tuple3('Info', BusinessInfo(), null),
    Tuple3('Photos', BusinessPhotos(), null),
    Tuple3(
      'Reviews',
      BusinessReviews(),
      (BuildContext context) {
        return FloatingActionButton.extended(
          icon: const Icon(Icons.rate_review),
          label: const Text('Write a review'),
          backgroundColor: kPrimaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddReviewScreen()),
            );
          },
        );
      },
    ),
  ];

  Future<Business> business;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() => setState(() {}));

    User user = Provider.of<Auth>(context, listen: false).user;

    Provider.of<BusinessProvider>(context, listen: false)
        .fetchBusiness(businessId: widget.businessId, userId: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
              // _tabController,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverPersistentHeaderDelegateImpl(
                tabBar: TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  tabs: _pages
                      .map<Tab>((Tuple3 page) => Tab(text: page.item1))
                      .toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _pages.map<Widget>((Tuple3 page) => page.item2).toList(),
        ),
      ),
      floatingActionButton:
          business.reviewedByUser || _pages[_tabController.index].item3 == null
              ? null
              : _pages[_tabController.index].item3(context),
    );
  }
}
