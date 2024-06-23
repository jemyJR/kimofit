import 'package:kimofit/core/networking/api/api_endpoints.dart';

class ChangePasswordModel {
  final String oldPassword;
  final String newPassword;

  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.oldPassword: oldPassword,
      ApiKey.newPassword: newPassword,
    };
  }
}
