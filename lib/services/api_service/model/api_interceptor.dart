import 'package:dio/dio.dart';

class ApiInterceptor {
  final String name;
  final InterceptorsWrapper interceptor;

  ApiInterceptor({required this.name, required this.interceptor});
}
