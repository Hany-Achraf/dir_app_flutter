import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();
  // dio.options.baseUrl = "http://192.168.1.124:80/"; // Office
  dio.options.baseUrl = "http://192.168.1.22:80/"; // Mohamed
  dio.options.headers['accept'] = 'Application/Json';
  return dio;
}
