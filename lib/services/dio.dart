import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();
  //ios
  //dio.options.baseUrl = "http://localhost:8000/api";
  //android
  dio.options.baseUrl = "http://192.168.1.124:80/"; // Office
  // dio.options.baseUrl = "http://192.168.43.105:80/"; // Hotspot
  // dio.options.baseUrl = "http://192.168.1.30:80/"; // Mohamed's Home
  dio.options.headers['accept'] = 'Application/Json';
  // dio.options.headers['Connection'] = 'Keep-Alive';
  // dio.options.headers['Keep-Alive'] = 'timeout=5, max=1000';
  // dio.options.headers['connectTimeout'] = 60 * 1000;
  // dio.options.headers['receiveTimeout'] = 60 * 1000;
  return dio;
}
