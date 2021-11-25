// import 'package:flutter/material.dart';
// import 'package:rnb_dir_app/src/login_page.dart';
// import 'package:rnb_dir_app/src/signup_page.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';

// class WelcomePage extends StatefulWidget {
//   WelcomePage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _WelcomePageState createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   // final storage = const FlutterSecureStorage();

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   readToken();
//   // }

//   // void readToken() async {
//   //   String? token = await storage.read(key: 'token');
//   //   Provider.of<Auth>(context, listen: false).tryToken(token: token);
//   // }

//   Widget _submitButton() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LoginPage()));
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.symmetric(vertical: 13),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(5)),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                   color: HexColor("#A46DFF").withAlpha(100),
//                   offset: Offset(2, 4),
//                   blurRadius: 8,
//                   spreadRadius: 2)
//             ],
//             color: Colors.white),
//         child: Text(
//           'Login',
//           style: TextStyle(fontSize: 20, color: HexColor("#A46DFF")),
//         ),
//       ),
//     );
//   }

//   Widget _signUpButton() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => SignUpPage()));
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.symmetric(vertical: 13),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           border: Border.all(color: Colors.white, width: 2),
//         ),
//         child: Text(
//           'Register now',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//       ),
//     );
//   }

//   Widget _label() {
//     return Container(
//         margin: EdgeInsets.only(top: 40, bottom: 20),
//         child: Column(
//           children: <Widget>[
//             Text(
//               'Quick login with Touch ID',
//               style: TextStyle(color: Colors.white, fontSize: 17),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Icon(Icons.fingerprint, size: 90, color: Colors.white),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               'Touch ID',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 15,
//                 decoration: TextDecoration.underline,
//               ),
//             ),
//           ],
//         ));
//   }

//   Widget _title() {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//           text: 'Everything',
//           style: GoogleFonts.portLligatSans(
//             textStyle: Theme.of(context).textTheme.headline1,
//             fontSize: 30,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//           children: [
//             TextSpan(
//               text: ' in ',
//               style: TextStyle(color: Colors.black, fontSize: 30),
//             ),
//             TextSpan(
//               text: 'Southkey',
//               style: TextStyle(color: Colors.white, fontSize: 30),
//             ),
//           ]),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(5)),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                     color: Colors.grey.shade200,
//                     offset: Offset(2, 4),
//                     blurRadius: 5,
//                     spreadRadius: 2)
//               ],
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [HexColor("#A46DFF"), HexColor("#9E9E9E")])),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               _title(),
//               SizedBox(
//                 height: 80,
//               ),
//               _submitButton(),
//               SizedBox(
//                 height: 20,
//               ),
//               _signUpButton(),
//               SizedBox(
//                 height: 20,
//               ),
//               // _label()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
