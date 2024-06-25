import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/features/home/data/models/home_response_model/subscription_model.dart';
import 'package:kimofit/features/profile/data/models/trainee_model.dart';

class ProfileResponseModel {
  final TraineeModel trainee;
  final SubscriptionModel subscription;

  ProfileResponseModel({
    required this.trainee,
    required this.subscription,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return ProfileResponseModel(
      trainee: TraineeModel.fromJson(json[ApiKey.trainee]),
      subscription: SubscriptionModel.fromJson(json[ApiKey.subscription]),
    );
  }
}
