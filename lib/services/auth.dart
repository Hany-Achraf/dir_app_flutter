import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class Auth extends ChangeNotifier {
  bool _loading = true;
  bool _isLoggedIn = false;
  bool _gotError = false;
  User _user = null;
  String _token = null;

  bool get loading => _loading;
  bool get authenticated => _isLoggedIn;
  bool get gotError => _gotError;
  User get user => _user;
  String get token => _token;

  final storage = const FlutterSecureStorage();

  void register({@required Map creds}) async {
    try {
      // Response response = await dio().post('/register', data: creds);
      http.Response response = await http.post(
        Uri.parse('$api/register'),
        body: creds,
        headers: {
          'Accept': 'application/json',
        },
      );
      var responseJson = jsonDecode(response.body);

      String token = responseJson['token'].toString();

      _isLoggedIn = true;
      _user = User.fromJson(responseJson['user']);
      _token = token;
      storeToken(token: token);
      _loading = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> login({@required Map creds}) async {
    String message = null;
    _loading = true;
    notifyListeners();
    http.Response response = await http.post(
      Uri.parse('$api/login'),
      body: creds,
      headers: {
        'Accept': 'application/json',
      },
    );
    var responseJson = jsonDecode(response.body);

    if (response.statusCode == 201) {
      String token = responseJson['token'].toString();
      _isLoggedIn = true;
      _user = User.fromJson(responseJson['user']);
      _token = token;
      storeToken(token: token);
    } else {
      if (responseJson['errors']['email'] != null) {
        message = responseJson['errors']['email'][0];
      }
    }

    _loading = false;
    notifyListeners();

    return message;
  }

  void tryToken({String token}) async {
    if (token == null) {
      _loading = false;
      notifyListeners();
      return;
    } else {
      try {
        http.Response response = await http.get(Uri.parse('$api/user'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            });

        if (response.statusCode == 200) {
          _isLoggedIn = true;
          _user = User.fromJson(jsonDecode(response.body));
          _token = token;
          storeToken(token: token);
        } else {
          // cleanUp();
        }
        _loading = false;
        notifyListeners();
      } catch (e) {
        rethrow;
      }
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
      print("\nTokens on logout: $_token\n");

      http.Response response = await http.get(Uri.parse('$api/logout'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
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

  void update({@required Map data}) async {
    _loading = true;
    notifyListeners();

    var request =
        http.MultipartRequest('POST', Uri.parse('$api/user/${user.id}/update'));
    request.headers['Accept'] = 'application/json';
    request.fields['firstname'] = data['firstname'];
    request.fields['lastname'] = data['lastname'];
    var image =
        await http.MultipartFile.fromPath('image', data['image_file_path']);
    request.files.add(image);

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      _user.firstname = responseJson['user']['firstname'];
      _user.lastname = responseJson['user']['lastname'];
      _user.avatarImgPath = responseJson['user']['avatar_img_path'];
    }
    // else {
    //   _gotError = true;
    // }
    _loading = false;
    notifyListeners();
  }
}
