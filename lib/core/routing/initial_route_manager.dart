import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/routing/routes.dart';

class InitialRouteManager {
  static Future<String> determineInitialRoute() async {
    final isUserLoggedIn =
        await getIt<CacheHelper>().getData(key: Constants.isUserLoggedIn) ??
            false;
    final isOnBoardingVisited = await getIt<CacheHelper>()
            .getData(key: Constants.isOnBoardingVisited) ??
        false;

    if (isUserLoggedIn) {
      return Routes.homeScreen;
    } else if (isOnBoardingVisited) {
      return Routes.loginScreen;
    } else {
      return Routes.onBoardingScreen;
    }
  }
}
