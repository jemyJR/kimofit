import 'package:kimofit/core/networking/api/api_endpoints.dart';

class UserCredentialsModel {
  final String token;
  final String refreshToken;
  final int? id;
  UserCredentialsModel({
    required this.token,
    required this.refreshToken,
    this.id,
  });
  factory UserCredentialsModel.fromJson(Map<String, dynamic> json) {
    return UserCredentialsModel(
      token: json[ApiKey.token],
      refreshToken: json[ApiKey.refreshToken],
      id: json[ApiKey.id],
    );
  }
}
