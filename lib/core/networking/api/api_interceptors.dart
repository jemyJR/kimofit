import 'package:dio/dio.dart';
import 'package:kimofit/app/ui/kimofit_app.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/user_credentials/user_credentials.dart';
import 'package:kimofit/core/networking/user_credentials/user_credentials_model.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/generated/l10n.dart';

class ApiInterceptors extends Interceptor {
  final Dio dio;
  ApiInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final headers = await HeaderHelper.getAuthHeaders();
    options.headers.addAll(headers);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final bool isBadRequest = err.response?.statusCode == 400 &&
        err.response?.data[ApiKey.errorMessage] == ApiKey.tokenExpiredMessage;

    final bool isUnauthorized = err.response?.statusCode == 401 &&
        err.response?.data[ApiKey.errorCode] == ApiKey.tokenNotValid;

    if (isBadRequest) {
      logOut();
    } else if (isUnauthorized) {
      final bool hasRefreshToken = await UserCredentials.hasRefreshToken();
      if (hasRefreshToken) {
        bool success = await _refreshToken();
        if (success) {
          return handler.resolve(await _retry(err.requestOptions));
        } else {
          logOut();
        }
      }
    }

    return handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: await HeaderHelper.getAuthHeaders(),
    );
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> _refreshToken() async {
    final refreshToken = await UserCredentials.getRefreshToken();

    try {
      final response = await dio.post(
        ApiEndPoints.refreshToken,
        data: {
          ApiKey.refreshToken: refreshToken,
        },
      );
      final UserCredentialsModel userCredentials =
          UserCredentialsModel.fromJson(response.data);

      UserCredentials.saveAll(userCredentials);
      return true;
    } on ServerException {
      logOut();
      return false;
    }
  }

  void logOut() {
    UserCredentials.deleteAll(S.of(contextGlobal).tokenExpiredMessage);
  }
}

class HeaderHelper {
  static Future<Map<String, String>> getAuthHeaders() async {
    String token = await UserCredentials.getToken() ?? '';

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
