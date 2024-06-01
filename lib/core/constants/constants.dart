import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';

class Constants {
  static const String appName = 'KimoFit';
  static const String appFont = 'Cairo';
  static const String isOnBoardingVisited = 'isOnBoardingVisited';
  static const String languageCode = 'languageCode';
}

class SavedData {
  static bool isOnBoardingVisited = false;
  static String languageCode = 'ar';

  static Future<void> init() async {
    //! isOnBoardingVisited
    isOnBoardingVisited = await getIt<CacheHelper>()
            .getData(key: Constants.isOnBoardingVisited) ??
        false;

    //! languageCode
    languageCode =
        await getIt<CacheHelper>().getData(key: Constants.languageCode) ?? 'ar';
  }
}
