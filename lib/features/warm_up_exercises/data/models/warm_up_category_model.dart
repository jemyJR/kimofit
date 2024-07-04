import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class WarmUpCategoryModel {
  final LocalizedField name;
  final String category;
  final String image;

  WarmUpCategoryModel({
    required this.name,
    required this.category,
    required this.image,
  });

  factory WarmUpCategoryModel.fromJson(Map<String, dynamic> json) {
    return WarmUpCategoryModel(
      name: LocalizedField.fromJson(json[ApiKey.warmupCategoryName]),
      category: json[ApiKey.warmupCategory],
      image: json[ApiKey.warmupCategoryImage],
    );
  }
}
