import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class ErrorModel {
  final String? errorMessage;
  final String? errorCode;

  //! This is to handle errors in the sign up screen
  final String? phone;
  final String? deviceId;

  //! This is to handle errors in the home screen
  final LocalizedField? trainerName;

  ErrorModel({
    this.errorMessage,
    this.errorCode,
    this.phone,
    this.deviceId,
    this.trainerName,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    // To fix the error in login screen when the user enter wrong credentials
    LocalizedField? trainerName;
    if (json[ApiKey.trainee] != null) {
      trainerName =
          LocalizedField.fromJson(json[ApiKey.trainee][ApiKey.trainerName]);
    }
    return ErrorModel(
      errorMessage: json[ApiKey.errorMessage],
      errorCode: json[ApiKey.errorCode],
      phone: json[ApiKey.phone],
      deviceId: json[ApiKey.deviceId],
      trainerName: trainerName,
    );
  }
}
