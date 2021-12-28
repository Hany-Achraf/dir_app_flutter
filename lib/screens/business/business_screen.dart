import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:plant_app/screens/business/components/add_review_screen.dart';
import 'package:plant_app/screens/business/components/business_info.dart';
import 'package:plant_app/screens/business/components/business_reviews.dart';
import 'package:plant_app/screens/business/components/business_sliver_app_bar.dart';
import 'package:plant_app/screens/business/components/business_photos.dart';
import 'package:plant_app/screens/business/delegates/sliver_persistent_header_delegate_impl.dart';
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
  Future<Business> business;

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

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    business = Provider.of<BusinessProvider>(context, listen: false)
        .fetchBusiness(businessId: widget.businessId);

    // Provider.of<BusinessProvider>(context, listen: false)
    //     .loadBusinsessReviews();

    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: business,
          builder: (context, AsyncSnapshot<Business> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.address);

              return NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    BusinessSliverAppBar(
                        // 'Lorem ipsum dolor sit amet, ptate velit esse cillum dolore eu fugiat nulla pariatur.',
                        // 'Business Name',
                        snapshot.data.name,
                        _tabController),
                    // BusinessSliverAppBar('Lorem ipsum dolor sit amet, consectetur adipiscing elit', _tabController),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverPersistentHeaderDelegateImpl(
                        tabBar: TabBar(
                          labelColor: Colors.black,
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
                  children:
                      _pages.map<Widget>((Tuple3 page) => page.item2).toList(),
                ),
              );
            }

            return Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            ));
          }),
      floatingActionButton: _pages[_tabController.index].item3 == null
          ? null
          : _pages[_tabController.index].item3(context),
    );
  }
}
