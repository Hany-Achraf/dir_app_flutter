import 'package:flutter/material.dart';
import 'package:plant_app/screens/auth/loading_page.dart';
import 'package:plant_app/screens/auth/welcome_page.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, auth, child) {
      if (auth.loading) {
        return Loading();
      }

      if (!auth.authenticated) {
        return WelcomePage();
      }

      return Scaffold(
          appBar: AppBar(
            title: const Text('Everything In SouthKey'),
          ),
          body: const Center(
            child: Text('Home'),
          ),
          drawer: Drawer(
              child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Text(
                      'Hany Mohamed',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "hany@ashraf.com",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
            ],
          )));
    });
  }
}
