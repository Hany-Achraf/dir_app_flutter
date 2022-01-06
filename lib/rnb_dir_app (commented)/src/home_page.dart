// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:rnb_dir_app/services/auth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:provider/provider.dart';
// import 'package:dio/dio.dart' as Dio;
// import 'package:rnb_dir_app/services/dio.dart';
// import 'package:rnb_dir_app/src/login_page.dart';
// import 'dart:convert';

// class Thing {
//   String name;
//   String thumbnail;

//   Thing({required this.name, required this.thumbnail});

//   Thing.fromJson(Map<String, dynamic> json)
//       : name = json['name'],
//         thumbnail = json['thumbnail'];
// }

// Future<List<Thing>> loadThings(BuildContext context) async {
//   List<Thing> things = [];
//   String? token = Provider.of<Auth>(context, listen: false).token;

//   Response response = await dio().get('/businesses',
//       options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));

//   response.data.forEach((rawJson) {
//     things.add(Thing.fromJson(rawJson));
//   });

//   print(things);

//   return things;
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   Future<List<Thing>>? _things;

//   @override
//   void initState() {
//     _things = loadThings(context);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Everything In SouthKey'),
//         ),
//         body: Center(
//           child: FutureBuilder<List>(
//             future: _things, // a previously-obtained Future<String> or null
//             builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                   children: [
//                     Card(
//                       elevation: 7,
//                       child: Container(
//                           height: 300,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5)),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Container(
//                                 margin: EdgeInsets.only(left: 3, top: 3),
//                                 child: Text(
//                                   'Featured',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 25),
//                                 ),
//                               ),
//                               Container(
//                                 height: 260.0,
//                                 child: ListView.builder(
//                                   itemCount: snapshot.data!.length,
//                                   scrollDirection: Axis.horizontal,
//                                   itemBuilder: (context, index) {
//                                     return Container(
//                                       width: 150.0,
//                                       child: Card(
//                                         elevation: 0,
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Container(
//                                               height: 180,
//                                               decoration: BoxDecoration(
//                                                 image: DecorationImage(
//                                                   image: NetworkImage('ppp'),
//                                                   fit: BoxFit.cover,
//                                                   alignment:
//                                                       Alignment.topCenter,
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(height: 2),
//                                             Text(
//                                               'aaaa',
//                                               maxLines: 2,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.w500,
//                                                   fontSize: 20),
//                                             ),
//                                             Text(
//                                               'baaa',
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: TextStyle(
//                                                   color: Colors.grey,
//                                                   fontWeight: FontWeight.w400,
//                                                   fontSize: 17),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               )
//                             ],
//                           )),
//                     ),
//                   ],
//                 );
//               }
//               return SizedBox(
//                 child: CircularProgressIndicator(),
//                 width: 60,
//                 height: 60,
//               );
//             },
//           ),
//         ),
//         drawer: Drawer(
//             child: ListView(
//           children: [
//             DrawerHeader(
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                     // backgroundImage: NetworkImage(auth.user!.avatar),
//                     radius: 30,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     // auth.user!.name,
//                     "AAA",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     // auth.user!.email,
//                     "aaa@aaa.com",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),
//             ListTile(
//               title: Text('Logout'),
//               leading: Icon(Icons.logout),
//               onTap: () {
//                 Provider.of<Auth>(context, listen: false).logout();
//               },
//             ),
//           ],
//         )));
//   }
// }
