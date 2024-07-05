import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';

class WarmUpCategoryResponseModel {
  final List<WarmUpCategoryModel> results;

  WarmUpCategoryResponseModel({required this.results});

  factory WarmUpCategoryResponseModel.fromJson(List<dynamic> jsonList) {
    return WarmUpCategoryResponseModel(
      results: jsonList.map((e) => WarmUpCategoryModel.fromJson(e)).toList(),
    );
  }
}
