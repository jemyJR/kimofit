import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/diet_plan/data/models/meal_model.dart';

class DietModel {
  final String title;
  final List<MealModel> meals;

  DietModel({
    required this.title,
    required this.meals,
  });

  factory DietModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> meals = json[ApiKey.dietMeals];

    return DietModel(
      title: json[ApiKey.dietTitle],
      meals: meals.map((e) => MealModel.fromJson(e)).toList(),
    );
  }
}
