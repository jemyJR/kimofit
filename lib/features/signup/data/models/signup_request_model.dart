import 'package:kimofit/core/networking/api/api_endpoints.dart';

class SignupRequestModel {
  final String name;
  final String phone;
  final String password;
  final String deviceId;

  SignupRequestModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.name: name,
      ApiKey.phone: phone,
      ApiKey.password: password,
      ApiKey.deviceId: deviceId,
    };
  }
}
