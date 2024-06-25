import 'package:kimofit/core/helpers/localized_field.dart';

class SupplementModel {
  LocalizedField name;
  String image;
  List<SupplementDosesModel> doses;

  SupplementModel({
    required this.name,
    required this.image,
    required this.doses,
  });
}

class SupplementDosesModel {
  int dose;
  String times;

  SupplementDosesModel({
    required this.dose,
    required this.times,
  });
}
