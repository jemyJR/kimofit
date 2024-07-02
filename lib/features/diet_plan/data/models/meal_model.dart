import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/diet_plan/data/models/option_model.dart';

class MealModel {
  LocalizedField name;
  List<OptionModel> options;
  MealModel({
    required this.name,
    required this.options,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> options = json[ApiKey.dietOptions];

    return MealModel(
      name: LocalizedField.fromJson(json[ApiKey.dietMealName]),
      options: options.map((e) => OptionModel.fromJson(e)).toList(),
    );
  }
}
