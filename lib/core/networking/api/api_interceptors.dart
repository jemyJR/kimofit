import 'package:dio/dio.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.acceptLanguage] = SavedData.languageCode;
    super.onRequest(options, handler);
  }
}
