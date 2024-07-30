import 'package:kimofit/core/networking/api/api_endpoints.dart';

class CalendarDaysParams {
  final String week;

  CalendarDaysParams({
    required this.week,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.calendarweekType: week,
    };
  }
}
