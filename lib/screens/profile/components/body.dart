import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/profile/edit_profile_screen.dart';
import 'package:plant_app/screens/profile/feedback_screen.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            height: 130,
            width: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(65),
              child: Image.asset(
                'assets/images/tarek.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            'tarek.hamed@gmail.com',
            style: TextStyle(
              color: kTextLightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          ProfileMenu(
            text: 'Edit Profile',
            icon: 'assets/icons/User Icon.svg',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
          ),
          ProfileMenu(
            text: 'Feedback/Report Issue',
            icon: 'feedback',
            // text: 'Help Center',
            // icon: 'assets/icons/Question mark.svg',

            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackScreen()),
              );
            },
          ),
          ProfileMenu(
            text: 'Log Out',
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
