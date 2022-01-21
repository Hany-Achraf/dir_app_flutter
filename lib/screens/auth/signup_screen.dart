import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/auth/login_screen.dart';
import 'package:plant_app/screens/auth/verify_email_screen.dart';
import 'package:provider/provider.dart';
import 'package:plant_app/services/auth.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _errorController = TextEditingController();
  bool _showErrorMessage = false;

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  Widget _entryField(String title, TextEditingController controller,
      {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(color: kPrimaryColor),
          // border: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          fillColor: Color(0xfff3f3f4),
          filled: true,
        ),
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () async {
        _errorController.text = '';
        if (_firstnameController.text.isEmpty) {
          _errorController.text += 'Firstname is required.';
        }
        if (_lastnameController.text.isEmpty) {
          _errorController.text += _errorController.text.isNotEmpty ? '\n' : '';
          _errorController.text += 'Lastname is required.';
        }
        if (_emailController.text.isEmpty) {
          _errorController.text += _errorController.text.isNotEmpty ? '\n' : '';
          _errorController.text += 'Email address is required.';
        }
        if (_passwordController.text.isEmpty) {
          _errorController.text += _errorController.text.isNotEmpty ? '\n' : '';
          _errorController.text += 'Password is required.';
        } else {
          if (_passwordController.text.length < 8) {
            _errorController.text +=
                _errorController.text.isNotEmpty ? '\n' : '';
            _errorController.text += 'Password must be at least 8 characters.';
          }
          if (_passwordConfirmationController.text !=
              _passwordController.text) {
            _errorController.text +=
                _errorController.text.isNotEmpty ? '\n' : '';
            _errorController.text += 'Password confirmation does not match.';
          }
        }

        if (_errorController.text.isNotEmpty) {
          setState(() {
            _showErrorMessage = true;
          });
        } else {
          Map creds = {
            'firstname': _firstnameController.text,
            'lastname': _lastnameController.text,
            'email': _emailController.text,
            'password': _passwordController.text,
            'password_confirmation': _passwordConfirmationController.text,
            'device_name': 'ios',
          };
          String message = await Provider.of<Auth>(context, listen: false)
              .register(creds: creds);
          if (message != null) {
            setState(() {
              _errorController.text = message;
              _showErrorMessage = true;
            });
          } else {
            Provider.of<Auth>(context, listen: false).sendVerificationEmail();
            Navigator.of(context).pop();
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [kPrimaryColor, HexColor("#9E9E9E")])),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Already have an account?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text(
              'Login',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField('Firstname', _firstnameController),
        _entryField('Lastname', _lastnameController),
        _entryField('Email', _emailController),
        _entryField('Password', _passwordController, isPassword: true),
        _entryField(
          'Password confirmation',
          _passwordConfirmationController,
          isPassword: true,
        ),
      ],
    );
  }

  Widget _errorMessages() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        maxLines: null,
        style: TextStyle(
          fontSize: 14,
          color: Colors.red.shade900,
        ),
        controller: _errorController,
        readOnly: true,
        decoration: InputDecoration(
          enabled: false,
          fillColor: Colors.red.shade100,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Everything in Southkey',
        ),
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _showErrorMessage ? _errorMessages() : Container(),
                  _emailPasswordWidget(),
                  // SizedBox(height: 20),
                  _submitButton(),
                  // SizedBox(height: height * .14),
                  _loginAccountLabel(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
