import 'package:dio/dio.dart' show Interceptor;
//  RequestOptions, RequestInterceptorHandler;
// import 'package:mobile_app/core/api/end_ponits.dart';
// import 'package:mobile_app/helpers/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   // final String? token = CacheHelper().getDataString(ApiKey.token);
  //   // final bool isLoggedIn = token != null && token.isNotEmpty;
  //   // options.headers[ApiKey.authorization] = isLoggedIn ? "Token $token" : null;
  //   super.onRequest(options, handler);
  // }
}
