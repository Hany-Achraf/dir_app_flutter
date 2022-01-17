import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/screens/home/home_screen.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

class VerifyEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<Auth>(context, listen: false).user;

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(
              //     'We have sent a verification email to ${user.email}, please verify then click "Proceed"'),
              Text(
                  'We have sent a verification email to hany@hany.net, please verify then click "Proceed"'),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    ModalRoute.withName('/'),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(color: kPrimaryColor),
                  child: Text('Proceed'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
