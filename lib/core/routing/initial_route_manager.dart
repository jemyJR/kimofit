// initial_route_manager.dart
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/routing/routes.dart';

class InitialRouteManager {
  static Future<String> determineInitialRoute() async {
    await SavedData.init();

    if (SavedData.isUserLoggedIn) {
      return Routes.homeScreen;
    } else if (SavedData.isOnBoardingVisited) {
      return Routes.loginScreen;
    } else {
      return Routes.onBoardingScreen;
    }
  }
}
