import 'package:kimofit/core/networking/api/api_endpoints.dart';

class SubscriptionModel {
  final String startDate;
  final String endDate;
  final bool status;
  final double percent;
  final bool isPaid;
  final int? subscriptionMonths;
  SubscriptionModel({
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.percent,
    required this.isPaid,
    this.subscriptionMonths,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      startDate: json[ApiKey.subscriptionStartDate],
      endDate: json[ApiKey.subscriptionEndDate],
      status: json[ApiKey.subscriptionStatus],
      percent: json[ApiKey.subscriptionPercent],
      isPaid: json[ApiKey.subscriptionIsPaid],
      subscriptionMonths: json[ApiKey.subscriptionMonths],
    );
  }
}
