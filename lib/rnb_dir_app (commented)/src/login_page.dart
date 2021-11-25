// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rnb_dir_app/src/home_page.dart';
// import 'package:rnb_dir_app/services/auth.dart';
// import 'package:rnb_dir_app/src/signup_page.dart';
// import 'package:sign_button/sign_button.dart';
// import 'package:hexcolor/hexcolor.dart';

// import 'Widget/bezierContainer.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({Key? key, this.title}) : super(key: key);

//   final String? title;

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     _emailController.text = 'hany@hany.com';
//     _passwordController.text = '123456';
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Widget _backButton() {
//     return InkWell(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
//               child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
//             ),
//             Text('Back',
//                 style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _entryField(String title, TextEditingController controller,
//       {bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           TextField(
//               controller: controller,
//               obscureText: isPassword,
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   fillColor: Color(0xfff3f3f4),
//                   filled: true)),
//         ],
//       ),
//     );
//   }

//   Widget _submitButton() {
//     return InkWell(
//       onTap: () {
//         Map creds = {
//           'email': _emailController.text,
//           'password': _passwordController.text,
//           'device_name': 'android',
//         };
//         if (_formKey.currentState!.validate()) {
//           Provider.of<Auth>(context, listen: false).login(creds: creds);
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => HomeScreen()),
//             ModalRoute.withName('/'),
//           );
//         }
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(5)),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                   color: Colors.grey.shade200,
//                   offset: const Offset(2, 4),
//                   blurRadius: 5,
//                   spreadRadius: 2)
//             ],
//             gradient: LinearGradient(
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 colors: [HexColor("#A46DFF"), HexColor("#9E9E9E")])),
//         child: Text(
//           'Login',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//       ),
//     );
//   }

//   Widget _divider() {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: <Widget>[
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           Text('or'),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Divider(
//                 thickness: 1,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _googleButton() {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.symmetric(vertical: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: SignInButton(
//         buttonType: ButtonType.google,
//         // text: 'Continue with Google',
//         onPressed: () {},
//       ),
//     );
//   }

//   Widget _facebookButton() {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.symmetric(vertical: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: SignInButton(
//         buttonType: ButtonType.facebook,
//         // text: 'Continue with Facebook',
//         onPressed: () {},
//       ),
//     );
//   }

//   // Widget _facebookButton() {
//   //   return Container(
//   //     height: 50,
//   //     margin: EdgeInsets.symmetric(vertical: 20),
//   //     decoration: BoxDecoration(
//   //       borderRadius: BorderRadius.all(Radius.circular(10)),
//   //     ),
//   //     child: Row(
//   //       children: <Widget>[
//   //         Expanded(
//   //           flex: 1,
//   //           child: Container(
//   //             decoration: BoxDecoration(
//   //               color: Color(0xff1959a9),
//   //               borderRadius: BorderRadius.only(
//   //                   bottomLeft: Radius.circular(5),
//   //                   topLeft: Radius.circular(5)),
//   //             ),
//   //             alignment: Alignment.center,
//   //             child: Text('f',
//   //                 style: TextStyle(
//   //                     color: Colors.white,
//   //                     fontSize: 25,
//   //                     fontWeight: FontWeight.w400)),
//   //           ),
//   //         ),
//   //         Expanded(
//   //           flex: 5,
//   //           child: Container(
//   //             decoration: BoxDecoration(
//   //               color: Color(0xff2872ba),
//   //               borderRadius: BorderRadius.only(
//   //                   bottomRight: Radius.circular(5),
//   //                   topRight: Radius.circular(5)),
//   //             ),
//   //             alignment: Alignment.center,
//   //             child: Text('Log in with Facebook',
//   //                 style: TextStyle(
//   //                     color: Colors.white,
//   //                     fontSize: 18,
//   //                     fontWeight: FontWeight.w400)),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget _createAccountLabel() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => SignUpPage()));
//       },
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 20),
//         padding: EdgeInsets.all(15),
//         alignment: Alignment.bottomCenter,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Don\'t have an account ?',
//               style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Text(
//               'Register',
//               style: TextStyle(
//                   color: HexColor("#A46DFF"),
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _title() {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//           text: 'Everything',
//           style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.w700,
//               color: HexColor("#696969")),
//           children: [
//             TextSpan(
//               text: ' in ',
//               style: TextStyle(color: Colors.black, fontSize: 30),
//             ),
//             TextSpan(
//               text: 'Southkey',
//               style: TextStyle(color: HexColor("#696969"), fontSize: 30),
//             ),
//           ]),
//     );
//   }

//   Widget _emailPasswordWidget() {
//     return Column(
//       children: <Widget>[
//         _entryField("Email", _emailController),
//         _entryField("Password", _passwordController, isPassword: true),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         body: Container(
//       height: height,
//       child: Stack(
//         children: <Widget>[
//           Positioned(
//             top: -height * .15,
//             right: -MediaQuery.of(context).size.width * .4,
//             child: BezierContainer(),
//             // child: Container(),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     // SizedBox(height: height * .1),
//                     const SizedBox(height: 80),
//                     // _title(),
//                     const SizedBox(height: 20),
//                     _emailPasswordWidget(),
//                     const SizedBox(height: 20),
//                     _submitButton(),
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       alignment: Alignment.centerRight,
//                       child: Text('Forgot Password ?',
//                           style: TextStyle(
//                               fontSize: 14, fontWeight: FontWeight.w500)),
//                     ),
//                     _divider(),
//                     _facebookButton(),
//                     _googleButton(),
//                     // SizedBox(height: height * .055),
//                     _createAccountLabel(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(top: 40, left: 0, child: _backButton()),
//         ],
//       ),
//     ));
//   }
// }
