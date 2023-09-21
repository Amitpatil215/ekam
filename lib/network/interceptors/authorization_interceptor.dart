import 'package:dio/dio.dart';
// ignore: constant_identifier_names

//* Request methods Get, PUT, POST, PATCH, DELETE needs access token,
//* which needs to be passed with "Authorization" header as Bearer token.
class AuthorizationInterceptor extends Interceptor {
  static String? loginId;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_needAuthorizationHeader(options)) {
      options.headers['Authorization'] = 'Bearer $loginId';
    }
    super.onRequest(options, handler);
  }

  bool _needAuthorizationHeader(RequestOptions options) {
    if (options.method == 'GET') {
      // return false;
      return true;
    } else {
      return true;
    }
  }
}
