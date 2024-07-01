import 'package:kimofit/core/networking/api/api_endpoints.dart';

class OptionModel {
  List<String> ingredients;
  OptionModel({
    required this.ingredients,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      ingredients: List<String>.from(json[ApiKey.dietIngredients]),
    );
  }
}
