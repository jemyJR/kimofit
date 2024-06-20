import 'package:dio/dio.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final headers = await HeaderHelper.getAuthHeaders();
    options.headers.addAll(headers);

    super.onRequest(options, handler);
  }
}

class HeaderHelper {
  static Future<Map<String, String>> getAuthHeaders() async {
    String token =
        await getIt<CacheHelper>().getSecuredData(key: ApiKey.token) ?? '';
    String languageCode =
        await getIt<CacheHelper>().getData(key: Constants.languageCode) ?? 'ar';

    // Create a map to store the headers
    final headers = <String, String>{};

    if (!token.isNullOrEmpty()) {
      headers[ApiKey.authorization] = ApiKey.bearer + token;
    }

    headers[ApiKey.acceptLanguage] = languageCode;

    return headers;
  }
}
