import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/app/ui/kimofit_app.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/app_fonts.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/theming/style.dart';
import 'package:kimofit/generated/l10n.dart';
import 'package:uuid/uuid.dart';

class DeviceIdService {
  static Future<String> getDeviceId() async {
    String? deviceId =
        await getIt<CacheHelper>().getSecuredData(key: Constants.deviceId);

    if (deviceId == null) {
      // Generate a new UUID
      deviceId = const Uuid().v4();

      await getIt<CacheHelper>().saveSecuredData(
        key: Constants.deviceId,
        value: deviceId,
      );
    }

    return deviceId;
  }

  static Future<void> showImportantNotice() async {
    bool showAlert =
        await getIt<CacheHelper>().getData(key: Constants.showDeviceIdAlert) ??
            true;
    bool isUserLoggedIn =
        await getIt<CacheHelper>().getData(key: Constants.isUserLoggedIn) ??
            false;

    if (showAlert && isUserLoggedIn) {
      showAlertDialog();
    }
  }

  static void setAlertNotToShowAgain() {
    getIt<CacheHelper>()
        .saveData(key: Constants.showDeviceIdAlert, value: false);
  }

  static void showAlertDialog() {
    showDialog(
      context: contextGlobal,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorsManager.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10).r,
          ),
          title: Text(
            S.of(context).importantNotice,
            textAlign: TextAlign.center,
            style:
                TextStyles.font22Blue.copyWith(fontFamily: AppFonts.lemonada),
          ),
          content: Text(
            S.of(context).deviceIdNoticeMessage,
            textAlign: TextAlign.center,
            style: TextStyles.font15White,
          ),
          actions: [
            TextButton(
              child: Text(
                S.of(context).close,
                style: TextStyles.font15BlueBold,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: Text(
                S.of(context).dontShowAgain,
                style: TextStyles.font15BlueBold,
              ),
              onPressed: () {
                setAlertNotToShowAgain();
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
