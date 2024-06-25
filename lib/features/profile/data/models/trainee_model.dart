import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class TraineeModel {
  final LocalizedField name;
  final String phone;
  final int? age;
  final double? height;
  final double? weight;

  TraineeModel({
    required this.name,
    required this.phone,
    this.age,
    this.height,
    this.weight,
  });
  factory TraineeModel.fromJson(Map<String, dynamic> json) {
    return TraineeModel(
      name: LocalizedField.fromJson(json[ApiKey.trainerName]),
      phone: json[ApiKey.phone],
      age: json[ApiKey.age],
      height: json[ApiKey.height],
      weight: json[ApiKey.weight],
    );
  }
}
