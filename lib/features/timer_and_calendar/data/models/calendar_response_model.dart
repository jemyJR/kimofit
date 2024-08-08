import 'package:kimofit/core/helpers/get_unique_days_with_off_duplicates.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class CalendarResponseModel {
  final List<LocalizedField> days;

  CalendarResponseModel({required this.days});

  factory CalendarResponseModel.fromJson(Map<String, dynamic> json) {
    final List<LocalizedField> days = [];
    for (var day in json[ApiKey.calendarDays]) {
      days.add(LocalizedField.fromJson(day));
    }

    return CalendarResponseModel(
      days: getUniqueDaysWithOffDuplicates(days),
    );
  }
}
