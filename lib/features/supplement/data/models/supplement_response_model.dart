import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/supplement/data/models/supplement_model.dart';

class SupplementResponseModel {
  SupplementResponseModel({
    required this.count,
    required this.results,
  });
  final int count;
  final List<SupplementModel> results;

  factory SupplementResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> results = json[ApiKey.results];
    return SupplementResponseModel(
        count: json[ApiKey.count],
        results: results.map((e) => SupplementModel.fromJson(e)).toList());
  }
}
