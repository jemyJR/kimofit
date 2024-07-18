import 'package:flutter/material.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/helpers/get_context.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/user_credentials/user_credentials_model.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';

class UserCredentials {
  static saveAll(UserCredentialsModel userCredentials) {
    getIt<CacheHelper>()
        .saveSecuredData(key: ApiKey.token, value: userCredentials.token);
    getIt<CacheHelper>().saveSecuredData(
        key: ApiKey.refreshToken, value: userCredentials.refreshToken);
    if (userCredentials.id != null) {
      getIt<CacheHelper>().saveSecuredData(
          key: ApiKey.id, value: userCredentials.id.toString());
    }
  }

  static Future<String?> getToken() async {
    return await getIt<CacheHelper>().getSecuredData(key: ApiKey.token);
  }

  static Future<String?> getRefreshToken() async {
    return await getIt<CacheHelper>().getSecuredData(key: ApiKey.refreshToken);
  }

  static Future<String?> getId() async {
    return await getIt<CacheHelper>().getSecuredData(key: ApiKey.id);
  }

  static Future<bool> hasRefreshToken() async {
    return await getIt<CacheHelper>()
        .containsSecuredKey(key: ApiKey.refreshToken);
  }

  static void deleteAll(String message) {
    BuildContext? context = GetContext.key.currentContext;
    // remove all user data exept device ID
    getIt<CacheHelper>().removeSecuredData(key: ApiKey.token);
    getIt<CacheHelper>().removeSecuredData(key: ApiKey.refreshToken);
    getIt<CacheHelper>().removeSecuredData(key: ApiKey.id);
    getIt<CacheHelper>().removeData(key: Constants.isUserLoggedIn);
    context!.pushNamedAndRemoveUntil(
      Routes.loginScreen,
      predicate: (route) => false,
    );
    customSnackBar(context, message);
  }
}
