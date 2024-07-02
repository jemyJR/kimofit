import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/diet_plan/data/models/diet_model.dart';

class DietPlanResponseModel {
  final String image;
  final List<String> notes;
  final List<DietModel> diets;

  DietPlanResponseModel({
    required this.image,
    required this.notes,
    required this.diets,
  });

  factory DietPlanResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> diets = json[ApiKey.diets];

    return DietPlanResponseModel(
      image: json[ApiKey.dietImage],
      notes: List<String>.from(json[ApiKey.dietNotes]),
      diets: diets.map((e) => DietModel.fromJson(e)).toList(),
    );
  }
}
