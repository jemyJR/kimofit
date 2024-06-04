import 'package:kimofit/core/networking/api/api_endpoints.dart';

class ErrorModel {
  final String? errorMessage;
  final String? errorCode;

  //! This is to handle errors in the sign up screen
  final String? phone;
  final String? deviceId;

  ErrorModel({
    this.errorMessage,
    this.errorCode,
    this.phone,
    this.deviceId,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      errorMessage: json[ApiKey.errorMessage],
      errorCode: json[ApiKey.errorCode],
      phone: json[ApiKey.phone],
      deviceId: json[ApiKey.deviceId],
    );
  }
}
