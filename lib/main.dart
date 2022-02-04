import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/providers/my_bottom_nav_provider.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:plant_app/providers/businesses_provider.dart';
import 'package:plant_app/providers/categories_provider.dart';
import 'package:plant_app/providers/destinations_provider.dart';
import 'package:plant_app/providers/events_provider.dart';
import 'package:plant_app/providers/promotions_provider.dart';
import 'package:plant_app/providers/see_all_businesses_provider.dart';
import 'package:plant_app/providers/search_provider.dart';
import 'package:plant_app/providers/see_all_events_provider.dart';
import 'package:plant_app/providers/see_all_promotions_provider.dart';
import 'package:plant_app/screens/home/home_screen.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProxyProvider<Auth, SearchProvider>(
          create: (context) => SearchProvider(auth: null),
          update: (context, auth, previousSearchProvider) =>
              SearchProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, SeeAllPromotionsProvider>(
          create: (context) => SeeAllPromotionsProvider(auth: null),
          update: (context, auth, previousSeeAllPromotionsProvider) =>
              SeeAllPromotionsProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, SeeAllEventsProvider>(
          create: (context) => SeeAllEventsProvider(auth: null),
          update: (context, auth, previousSeeAllEventsProvider) =>
              SeeAllEventsProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, SeeAllBusinessesProvider>(
          create: (context) => SeeAllBusinessesProvider(auth: null),
          update: (context, auth, previousSeeAllBusinessesProvider) =>
              SeeAllBusinessesProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, BusinessesProvider>(
          create: (context) => BusinessesProvider(auth: null),
          update: (context, auth, previousBusinessesProvider) =>
              BusinessesProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, BusinessProvider>(
          create: (context) => BusinessProvider(auth: null),
          update: (context, auth, previousBusinessProvider) =>
              BusinessProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, CategoriesProvider>(
          create: (context) => CategoriesProvider(auth: null),
          update: (context, auth, previousCategoriesProvider) =>
              CategoriesProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, DestinationsProvider>(
          create: (context) => DestinationsProvider(auth: null),
          update: (context, auth, previousDestinationsProvider) =>
              DestinationsProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, PromotionsProvider>(
          create: (context) => PromotionsProvider(auth: null),
          update: (context, auth, previousPromotionsProvider) =>
              PromotionsProvider(auth: auth),
        ),
        ChangeNotifierProxyProvider<Auth, EventsProvider>(
          create: (context) => EventsProvider(auth: null),
          update: (context, auth, previousEventsProvider) =>
              EventsProvider(auth: auth),
        ),
        ChangeNotifierProvider(create: (_) => BottomNavigatorProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    readToken();
  }

  void readToken() async {
    String token = await storage.read(key: 'token');
    Provider.of<Auth>(context, listen: false).tryToken(token: token);
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ScreenUtilInit(
      designSize: Size(1440, 2560),
      minTextAdapt: true,
      // splitScreenMode: true,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Everything in SouthKey',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: kPrimaryColor,
          ),
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget,
          );
        },
        home: HomeScreen(),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Everything in SouthKey',
    //   theme: ThemeData(
    //     appBarTheme: AppBarTheme(
    //       centerTitle: true,
    //       backgroundColor: kPrimaryColor,
    //     ),
    //     scaffoldBackgroundColor: kBackgroundColor,
    //     primaryColor: kPrimaryColor,
    //     textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   home: HomeScreen(),
    // );
  }
}
