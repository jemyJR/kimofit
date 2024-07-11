import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

class DeviceUtils {
  static const platform = MethodChannel('com.example.kimofit/deviceid');

  static Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String? deviceId;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

      String serial = androidInfo.supportedAbis.join(", ");

      String androidId = androidInfo.id;

      try {
        String getAndroidId = await platform.invokeMethod('getAndroidId');
        deviceId =
            _generateUniqueId(androidId, serial, getAndroidId) + getAndroidId;
      } on PlatformException catch (e) {
        deviceId = 'Failed to get Android ID: ${e.message}';
      }
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;

      String? identifierForVendor = iosInfo.identifierForVendor ?? '';
      String model = iosInfo.model;
      String systemVersion = iosInfo.systemVersion;

      deviceId = _generateUniqueId(identifierForVendor, model, systemVersion) +
          identifierForVendor;
    } else {
      deviceId = 'unknown';
    }

    return deviceId;
  }

  static String _generateUniqueId(
      String id, String additionalInfo, String deviceId) {
    var bytes = utf8.encode(id + additionalInfo + deviceId);
    return sha256.convert(bytes).toString();
  }
}
