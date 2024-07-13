import 'package:kimofit/core/helpers/get_unique_days_with_off_duplicates.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class HomeCardioCalenderResponseModel {
  final List<LocalizedField> days;

  HomeCardioCalenderResponseModel({required this.days});

  factory HomeCardioCalenderResponseModel.fromJson(Map<String, dynamic> json) {
    final List<LocalizedField> days = [];
    for (var day in json[ApiKey.calenderDays]) {
      days.add(LocalizedField.fromJson(day));
    }

    return HomeCardioCalenderResponseModel(
      days: getUniqueDaysWithOffDuplicates(days),
    );
  }
}
