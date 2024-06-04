import 'package:kimofit/core/networking/api/api_endpoints.dart';

class LoginRequestModel {
  final String phone;
  final String password;
  final String deviceId;

  LoginRequestModel({
    required this.phone,
    required this.password,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.phone: phone,
      ApiKey.password: password,
      ApiKey.deviceId: deviceId,
    };
  }
}
