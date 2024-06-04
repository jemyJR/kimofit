import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/device_info_service.dart';

class Constants {
  static const String appName = 'KimoFit';
  static const String appFont = 'Cairo';
  static const String isOnBoardingVisited = 'isOnBoardingVisited';
  static const String languageCode = 'languageCode';
  static const String deviceId = 'registered_device_id';
  static const String isUserLoggedIn = 'isUserLoggedIn';
}

class SavedData {
  static bool isOnBoardingVisited = false;
  static String languageCode = 'ar';
  static late String deviceId;
  static bool isUserLoggedIn = false;

  static Future<void> init() async {
    //! isOnBoardingVisited
    isOnBoardingVisited = await getIt<CacheHelper>()
            .getData(key: Constants.isOnBoardingVisited) ??
        false;

    //! languageCode
    languageCode =
        await getIt<CacheHelper>().getData(key: Constants.languageCode) ?? 'ar';

    //! deviceId
    deviceId = await getIt<CacheHelper>().getData(key: Constants.deviceId) ??
        await DeviceUtils.getDeviceId();

    await getIt<CacheHelper>()
        .saveData(key: Constants.deviceId, value: deviceId);

    //! isUserLoggedIn
    isUserLoggedIn =
        await getIt<CacheHelper>().getData(key: Constants.isUserLoggedIn) ??
            false;
  }
}
