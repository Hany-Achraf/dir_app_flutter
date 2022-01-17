import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:plant_app/screens/auth/loading_screen.dart';
import 'package:plant_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  Future<XFile> file;
  File imageFile;

  void chooseImage() {
    setState(() {
      file = ImagePicker().pickImage(source: ImageSource.gallery);
    });
  }

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    User user = Provider.of<Auth>(context, listen: false).user;
    _firstnameController.text = user.firstname;
    _lastnameController.text = user.lastname;
    super.initState();
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  Widget _entryField(String title, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: controller,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Map<String, dynamic> data = {
          'firstname': _firstnameController.text,
          'lastname': _lastnameController.text,
          'image_file_path': imageFile.path,
        };
        Provider.of<Auth>(context, listen: false).update(data: data);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                colors: [HexColor("#52766c"), HexColor("#9E9E9E")])),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<Auth>(context, listen: true);

    if (userProvider.loading) {
      return LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        elevation: 1.5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 130,
                  width: 130,
                  child: Stack(
                    fit: StackFit.expand,
                    overflow: Overflow.visible,
                    children: [
                      FutureBuilder(
                        future: file,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            imageFile = File(snapshot.data.path);
                            return CircleAvatar(
                              radius: MediaQuery.of(context).size.height * 0.12,
                              backgroundColor: kPrimaryColor,
                              backgroundImage: FileImage(imageFile),
                            );
                          }
                          return userProvider.user.avatarImgPath != null
                              ? CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.height * 0.12,
                                  backgroundImage: NetworkImage(
                                      '$url/${userProvider.user.avatarImgPath}'),
                                )
                              : CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.height * 0.12,
                                  backgroundColor: Color(0xFFE7EBEE),
                                  child: Image.asset(
                                    'assets/icons/avatar.png',
                                    color: kPrimaryColor,
                                  ),
                                );
                        },
                      ),
                      Positioned(
                        right: -16,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(65),
                              side: BorderSide(color: Colors.white),
                            ),
                            color: Color(0xFFF5F6F9),
                            onPressed: chooseImage,
                            child: SvgPicture.asset(
                                "assets/icons/Camera Icon.svg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: height * .1),
                Column(
                  children: <Widget>[
                    _entryField("First name", _firstnameController),
                    _entryField("Last name", _lastnameController),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
