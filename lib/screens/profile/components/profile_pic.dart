// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:plant_app/constants.dart';
// import 'package:plant_app/models/user_model.dart';
// import 'package:plant_app/services/auth.dart';
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfilePic extends StatefulWidget {
//   @override
//   State<ProfilePic> createState() => _ProfilePicState();
// }

// class _ProfilePicState extends State<ProfilePic> {
//   Future<XFile> file;
//   String status = '';
//   String base64Image;
//   File tmpFile;
//   String errMessage = 'Error Uploading Image';

//   void chooseImage() {
//     setState(() {
//       file = ImagePicker().pickImage(source: ImageSource.gallery);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     User user = Provider.of<Auth>(context, listen: true).user;

//     return SizedBox(
//       height: 130,
//       width: 130,
//       child: Stack(
//         fit: StackFit.expand,
//         overflow: Overflow.visible,
//         children: [
//           user.avatarImgPath != null
//               ? CircleAvatar(
//                   radius: MediaQuery.of(context).size.height * 0.12,
//                   backgroundImage: NetworkImage('$url/${user.avatarImgPath}'),
//                 )
//               : CircleAvatar(
//                   radius: MediaQuery.of(context).size.height * 0.12,
//                   backgroundColor: Color(0xFFE7EBEE),
//                   child: Image.asset(
//                     'assets/icons/avatar.png',
//                     color: kPrimaryColor,
//                   ),
//                 ),
//           Positioned(
//             right: -16,
//             bottom: 0,
//             child: SizedBox(
//               height: 46,
//               width: 46,
//               child: FlatButton(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(65),
//                   side: BorderSide(color: Colors.white),
//                 ),
//                 color: Color(0xFFF5F6F9),
//                 onPressed: chooseImage,
//                 child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
