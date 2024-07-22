import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';

class DropDownMenuParams {
  final LocalizedField week;
  final LocalizedField day;

  DropDownMenuParams({
    required this.week,
    required this.day,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKey.calenderweekType: week.id,
      ApiKey.calenderDayType: day.id,
    };
  }
}
