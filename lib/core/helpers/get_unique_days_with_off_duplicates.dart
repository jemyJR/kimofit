import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/timer_and_calender/data/calender_list.dart';

List<LocalizedField> getUniqueDaysWithOffDuplicates(List<LocalizedField> days) {
  List<LocalizedField> result = [];
  Set<String> seenDays = {};

  for (var day in days) {
    if (day.en == restDay.en) {
      if (result.length < 7) {
        result.add(day);
      }
    } else if (!seenDays.contains(day.en)) {
      result.add(day);
      seenDays.add(day.en);
    }
    if (result.length == 7) {
      break;
    }
  }

  // If the result length is less than 7, add no found days
  while (result.length < 7) {
    result.add(
      LocalizedField(en: 'not found', ar: 'غير موجود'),
    );
  }

  return result;
}
