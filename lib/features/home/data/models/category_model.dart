import 'package:kimofit/core/helpers/localized_field.dart';

class HomeCategoryModel {
  final int id;
  final LocalizedField name;
  final String image;
  HomeCategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });
}
