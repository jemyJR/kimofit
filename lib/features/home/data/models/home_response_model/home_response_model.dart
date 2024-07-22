import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/home/data/models/home_response_model/home_category_model.dart';
import 'package:kimofit/features/home/data/models/home_response_model/sponser_model.dart';
import 'package:kimofit/features/home/data/models/home_response_model/subscription_model.dart';

class HomeResponseModel {
  final List<SponserModel> sponsors;
  final List<HomeCategoryModel> categories;
  final LocalizedField trainerName;
  final SubscriptionModel subscription;

  HomeResponseModel({
    required this.sponsors,
    required this.categories,
    required this.trainerName,
    required this.subscription,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> sponsors = json[ApiKey.sponsers] ?? [];

    final List<dynamic> categories = json[ApiKey.categories];

    return HomeResponseModel(
      sponsors: sponsors.map((e) => SponserModel.fromJson(e)).toList(),
      categories: categories.map((e) => HomeCategoryModel.fromJson(e)).toList(),
      trainerName:
          LocalizedField.fromJson(json[ApiKey.trainee][ApiKey.trainerName]),
      subscription: SubscriptionModel.fromJson(json[ApiKey.subscription]),
    );
  }
}
