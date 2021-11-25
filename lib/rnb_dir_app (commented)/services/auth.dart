// import 'package:dio/dio.dart' as Dio;
// import 'package:flutter/material.dart';
// import 'package:rnb_dir_app/models/user.dart';
// import 'package:rnb_dir_app/services/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// class Auth extends ChangeNotifier {
//   bool _isLoggedIn = false;
//   User? _user;
//   String? _token;

//   bool get authenticated => _isLoggedIn;
//   User? get user => _user;
//   String? get token => _token;

//   final storage = const FlutterSecureStorage();

//   void register({required Map creds}) async {
//     try {
//       Dio.Response response = await dio().post('/register', data: creds);
//       String token = response.data['token'].toString();

//       _isLoggedIn = true;
//       _user = User.fromJson(response.data['user']);
//       _token = token;
//       storeToken(token: token);
//       notifyListeners();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   void login({required Map creds}) async {
//     try {
//       Dio.Response response = await dio().post('/login', data: creds);
//       String token = response.data['token'].toString();

//       _isLoggedIn = true;
//       _user = User.fromJson(response.data['user']);
//       _token = token;
//       storeToken(token: token);
//       notifyListeners();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // void tryToken({String? token}) async {
//   //   if (token == null) {
//   //     return;
//   //   } else {
//   //     try {
//   //       Dio.Response response = await dio().get('/user',
//   //           options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));

//   //       _isLoggedIn = true;
//   //       _user = User.fromJson(response.data);
//   //       _token = token;
//   //       storeToken(token: token);
//   //       notifyListeners();
//   //     } catch (e) {
//   //       rethrow;
//   //     }
//   //   }
//   // }

//   void readToken() async {
//     String? token = await storage.read(key: 'token');
//     if (token == null) return;

//     print("\nGiven token: $token\n");

//     _isLoggedIn = true;
//     // _user = User.fromJson(response.data);
//     _token = token;
//     notifyListeners();
//   }

//   void storeToken({required String token}) async {
//     try {
//       storage.write(key: 'token', value: token);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   void logout() async {
//     try {
//       print("\nTokens on logout: $_token\n");

//       await dio().get('/logout',
//           options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));
//       cleanUp();
//       notifyListeners();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   void cleanUp() async {
//     _user = null;
//     _isLoggedIn = false;
//     _token = null;

//     try {
//       await storage.delete(key: 'token');
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
