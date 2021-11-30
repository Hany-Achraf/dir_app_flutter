import 'package:flutter/material.dart';
import 'package:plant_app/screens/business/components/business_sliver_app_bar.dart';
import 'package:plant_app/screens/business/components/business_sub_screen.dart';
import 'package:plant_app/screens/business/components/portfolio_tutorials_sub_page.dart';
import 'package:plant_app/screens/business/delegates/sliver_persistent_header_delegate_impl.dart';
import 'package:tuple/tuple.dart';

class BusinessScreen extends StatefulWidget {
  BusinessScreen({Key key}) : super(key: key);

  @override
  _BusinessScreenState createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen>
    with SingleTickerProviderStateMixin {
  // final List<Tuple3> _pages = [
  //   Tuple3(
  //       'Info', BusinessSubScreen(pageName: 'Info'), Icon(Icons.video_library)),
  //   Tuple3('Photos', BusinessSubScreen(pageName: 'Photos'), Icon(Icons.image)),
  //   Tuple3(
  //       'Reviews', BusinessSubScreen(pageName: 'Reviews'), Icon(Icons.image)),
  // ];

  final List<Tuple3> _pages = [
    Tuple3('Info', PortfolioTutorialsSubPage(), Icon(Icons.video_library)),
    Tuple3('Photos', PortfolioTutorialsSubPage(), Icon(Icons.image)),
    Tuple3('Reviews', PortfolioTutorialsSubPage(), Icon(Icons.image)),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            BusinessSliverAppBar('Hany Ashraf Mohamed', _tabController),
            // BusinessSliverAppBar('Lorem ipsum dolor sit amet, consectetur adipiscing elit',_tabController),
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
          children: _pages.map<Widget>((Tuple3 page) => page.item2).toList(),
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.blue,
      //   child: TabBar(
      //     unselectedLabelColor: Colors.grey,
      //     labelColor: Colors.black,
      //     indicatorColor: Colors.black,
      //     controller: _tabController,
      //     tabs: _pages
      //         .map<Tab>((Tuple3 page) => Tab(
      //               text: page.item1,
      //               icon: page.item3,
      //             ))
      //         .toList(),
      //   ),
      // ),
    );
  }
}
