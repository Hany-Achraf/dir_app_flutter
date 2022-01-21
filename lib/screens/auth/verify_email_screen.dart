import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';

class VerifyEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Email Verification',
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: Container(),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'We have sent a verification email to you, please verify your email then click "Proceed"',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kTextColor,
                ),
              ),
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(2, 4),
                            blurRadius: 5,
                            spreadRadius: 2)
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [kPrimaryColor, HexColor("#9E9E9E")])),
                  child: Text(
                    'Proceed',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              TextButton(
                onPressed: () {
                  Provider.of<Auth>(context, listen: false)
                      .sendVerificationEmail();
                },
                child: Text(
                  'Resend verification email',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
