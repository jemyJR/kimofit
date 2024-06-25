import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/supplement/data/models/supplement_doses_model.dart';

class SupplementModel {
  LocalizedField name;
  String image;
  List<SupplementDosesModel> doses;

  SupplementModel({
    required this.name,
    required this.image,
    required this.doses,
  });
  factory SupplementModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> doses = json[ApiKey.supplementDose];
    return SupplementModel(
        name: LocalizedField.fromJson(json[ApiKey.supplementName]),
        image: json[ApiKey.supplementImage],
        doses: doses.map((e) => SupplementDosesModel.fromJson(e)).toList());
  }
}
