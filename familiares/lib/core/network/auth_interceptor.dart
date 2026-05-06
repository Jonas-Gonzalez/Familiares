import 'dart:convert';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String _user;
  final String _password;

  AuthInterceptor(this._user, this._password);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final credentials = base64.encode(utf8.encode('$_user:$_password'));
    options.headers['Authorization'] = 'Basic $credentials';
    handler.next(options);
  }
}