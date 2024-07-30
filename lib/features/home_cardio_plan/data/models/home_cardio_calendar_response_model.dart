import 'package:kimofit/core/helpers/get_unique_days_with_off_duplicates.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class HomeCardioCalendarResponseModel {
  final List<LocalizedField> days;

  HomeCardioCalendarResponseModel({required this.days});

  factory HomeCardioCalendarResponseModel.fromJson(Map<String, dynamic> json) {
    final List<LocalizedField> days = [];
    for (var day in json[ApiKey.calendarDays]) {
      days.add(LocalizedField.fromJson(day));
    }

    return HomeCardioCalendarResponseModel(
      days: getUniqueDaysWithOffDuplicates(days),
    );
  }
}
