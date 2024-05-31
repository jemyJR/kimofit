import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';

class Constants {
  static const String appName = 'KimoFit';
  static const String appFont = 'Cairo';
  static const String isOnBoardingVisited = 'isOnBoardingVisited';
}

class SavedData {
  static late bool isOnBoardingVisited;

  static Future<void> init() async {
    //! isOnBoardingVisited
    isOnBoardingVisited = await getIt<CacheHelper>()
            .getData(key: Constants.isOnBoardingVisited) ??
        false;
  }
}
