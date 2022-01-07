import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = Dio();
  dio.options.baseUrl = "http://192.168.1.124:80/"; // Company
  dio.options.headers['accept'] = 'Application/Json';
  return dio;
}
