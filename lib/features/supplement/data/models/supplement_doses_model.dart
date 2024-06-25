import 'package:kimofit/core/networking/api/api_endpoints.dart';

class SupplementDosesModel {
  int dose;
  String times;

  SupplementDosesModel({required this.dose, required this.times});
  factory SupplementDosesModel.fromJson(Map<String, dynamic> json) {
    return SupplementDosesModel(
      dose: json[ApiKey.supplementDose],
      times: json[ApiKey.supplementTimes],
    );
  }
}
