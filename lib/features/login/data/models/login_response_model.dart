import 'package:kimofit/core/networking/api/api_endpoints.dart';

class LoginResponseModel {
  final String token;
  final String refreshToken;

  LoginResponseModel({
    required this.refreshToken,
    required this.token,
  });
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      refreshToken: json[ApiKey.refreshToken],
      token: json[ApiKey.token],
    );
  }
}
