import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/providers/my_bottom_nav_provider.dart';
import 'package:plant_app/providers/business_provider.dart';
import 'package:plant_app/providers/businesses_provider.dart';
import 'package:plant_app/providers/categories_provider.dart';
import 'package:plant_app/providers/destinations_provider.dart';
import 'package:plant_app/providers/events_provider.dart';
import 'package:plant_app/providers/promotions_provider.dart';
import 'package:plant_app/screens/home/home_screen.dart';
import 'package:plant_app/screens/revenge/revenge.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  DateTime revengeDate = DateTime.utc(2022, 2, 28);

  if (DateTime.now().isBefore(revengeDate)) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CategoriesProvider()),
          ChangeNotifierProvider(create: (_) => DestinationsProvider()),
          ChangeNotifierProvider(create: (_) => BusinessesProvider()),
          ChangeNotifierProvider(create: (_) => BusinessProvider()),
          ChangeNotifierProvider(create: (_) => PromotionsProvider()),
          ChangeNotifierProvider(create: (_) => EventsProvider()),
          ChangeNotifierProvider(create: (_) => BottomNavigatorProvider()),
          ChangeNotifierProvider(create: (context) => Auth()),
        ],
        child: MyApp(),
      ),
    );
  } else {
    runApp(RevengeApp());
  }
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
    return MaterialApp(
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
      home: HomeScreen(),
    );
  }
}

class RevengeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Don\'t work there',
      home: RevengeScreen(),
    );
  }
}
