import 'package:dio/dio.dart';
import 'package:fwd_app/core/env/environment.dart';
import 'package:fwd_app/core/network/api_constants.dart';
import 'package:fwd_app/core/network/auth_interceptor.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(Environment env)
      : _dio = Dio(
          BaseOptions(
            baseUrl: env.apiBaseUrl,
            connectTimeout: ApiConstants.requestTimeout,
            receiveTimeout: ApiConstants.requestTimeout,
            headers: {'Content-Type': 'application/json'},
          ),
        ) {
    if (env.authUser != null && env.authPassword != null) {
      _dio.interceptors.add(AuthInterceptor(env.authUser!, env.authPassword!));
    }
  }

  Future<Response<T>> get<T>(String path) => _dio.get<T>(path);
  Future<Response<T>> post<T>(String path, {dynamic data}) =>
      _dio.post<T>(path, data: data);
}