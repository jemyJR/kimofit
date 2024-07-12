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
      String androidId = androidInfo.id;
      try {
        String getAndroidId = await platform.invokeMethod('getAndroidId');

        deviceId = getAndroidId + androidId;
      } on PlatformException catch (e) {
        deviceId = 'Failed to get Android ID: ${e.message}';
      }
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;

      deviceId = iosInfo.identifierForVendor;
    } else {
      deviceId = 'unknown';
    }

    return deviceId!;
  }

  static Future<String> generateUniqueId(
    String phoneNumber,
    String password,
    String deviceId,
  ) async {
    String deviceId = await getDeviceId();

    // Combine phone number, password, and device ID
    String combined = phoneNumber + password + deviceId;

    // Convert the combined string to bytes
    List<int> bytes = utf8.encode(combined);

    // Generate the hash
    Digest digest = sha256.convert(bytes);

    return digest.toString();
  }
}
