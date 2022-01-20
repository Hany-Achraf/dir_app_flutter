import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/screens/home/home_screen.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

class VerifyEmailScreen extends StatefulWidget {
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    Provider.of<Auth>(context, listen: false).sendVerificationEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<Auth>(context, listen: false).user;

    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'We have sent a verification email to you, please verify then click "Proceed"'),
              TextButton(
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  //   ModalRoute.withName('/'),
                  // );
                  Provider.of<Auth>(context, listen: false).getUser();
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
