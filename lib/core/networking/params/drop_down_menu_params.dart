import 'package:kimofit/core/networking/api/api_endpoints.dart';

class DropDownMenuParams {
  final String week;
  final String day;

  DropDownMenuParams({
    required this.week,
    required this.day,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.calenderweekType: week,
      ApiKey.calenderDayType: day,
    };
  }
}
