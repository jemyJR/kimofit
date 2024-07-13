import 'package:kimofit/core/networking/api/api_endpoints.dart';

class CalenderDaysParams {
  final String week;

  CalenderDaysParams({
    required this.week,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.calenderweektype: week,
    };
  }
}
