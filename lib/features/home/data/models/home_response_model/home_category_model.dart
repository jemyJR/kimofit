import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class HomeCategoryModel {
  final int id;
  final LocalizedField name;
  final String image;
  HomeCategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json[ApiKey.categoryId],
      name: LocalizedField.fromJson(json[ApiKey.categoryName]),
      image: json[ApiKey.categoryImage],
    );
  }
}
