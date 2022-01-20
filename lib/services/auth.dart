import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class Auth extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  String _token = null;
  String get token => _token;

  bool _loading = true;
  bool get loading => _loading;

  User _user = null;
  User get user => _user;

  bool _isLoggedIn = false;
  bool get authenticated => _isLoggedIn;

  bool _isVerified = false;
  bool get verified => _isVerified;

  void sendVerificationEmail() async {
    http.Response response = await http.post(
      Uri.parse('$api/email/verification-notification'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );
  }

  void getUser() async {
    _loading = true;
    notifyListeners();

    http.Response response = await http.get(
      Uri.parse('$api/user'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );
    var responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      storeToken(token: _token);
      _user = User.fromJson(responseJson);
      _isVerified = true;
    }

    _loading = false;
    notifyListeners();
  }

  Future<String> register({@required Map creds}) async {
    _loading = true;
    notifyListeners();

    String message = null;

    http.Response response = await http.post(
      Uri.parse('$api/register'),
      body: creds,
      headers: {
        'Accept': 'application/json',
      },
    );
    var responseJson = jsonDecode(response.body);
    if (response.statusCode == 201) {
      _token = responseJson['token'].toString();
      _isLoggedIn = true;
    } else {
      message = responseJson['errors']['email'][0];
    }

    _loading = false;
    notifyListeners();
    return message;
  }

  Future<String> login({@required Map creds}) async {
    _loading = true;
    notifyListeners();

    http.Response response = await http.post(
      Uri.parse('$api/login'),
      body: creds,
      headers: {
        'Accept': 'application/json',
      },
    );

    String message = null;
    var responseJson = json.decode(response.body);

    if (response.statusCode == 201) {
      _token = responseJson['token'];
      _isLoggedIn = true;
    } else {
      message = responseJson['errors']['email'][0];
    }

    _loading = false;
    notifyListeners();
    return message;
  }

  void tryToken({@required String token}) async {
    if (token == null) {
      _loading = false;
      notifyListeners();
      return;
    } else {
      http.Response response = await http.get(
        Uri.parse('$api/user'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        _isLoggedIn = true;
        _isVerified = true;
        _user = User.fromJson(json.decode(response.body));
      } else {
        cleanUp();
      }
      _loading = false;
      notifyListeners();
    }
  }

  void storeToken({@required String token}) async {
    try {
      storage.write(key: 'token', value: token);
    } catch (e) {
      rethrow;
    }
  }

  void logout() async {
    try {
      _loading = true;
      notifyListeners();

      http.Response response = await http.get(Uri.parse('$api/logout'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $_token'
          });
      cleanUp();

      _loading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void cleanUp() async {
    _user = null;
    _isLoggedIn = false;
    _token = null;

    try {
      await storage.delete(key: 'token');
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> update({@required Map data}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$api/user/${user.id}/update'));
    request.headers['Accept'] = 'application/json';
    request.fields['firstname'] = data['firstname'];
    request.fields['lastname'] = data['lastname'];

    if (data['image_file_path'] != null) {
      var image =
          await http.MultipartFile.fromPath('image', data['image_file_path']);
      request.files.add(image);
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      _user.firstname = responseJson['user']['firstname'];
      _user.lastname = responseJson['user']['lastname'];
      _user.avatarImgPath = responseJson['user']['avatar_img_path'];
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}



      // bool verificationEmailSent = await verify();
      // if (verificationEmailSent) {
      //   return null; // No errors, and verification email was sent successfully
      // } else {
      //   // remove failed user registration
      //   http.Response response = await http.delete(
      //     Uri.parse('$api/user/destroy'),
      //     headers: {
      //       'Accept': 'application/json',
      //       'Authorization': 'Bearer $_token',
      //     },
      //   );
      //   return 'Failed send you a verification email';
      // }