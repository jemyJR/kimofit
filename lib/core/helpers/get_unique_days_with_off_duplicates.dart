import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/features/timer_and_calendar/data/calendar_list.dart';

List<LocalizedField> getUniqueDaysWithOffDuplicates(List<LocalizedField> days) {
  List<LocalizedField> result = [];
  List<LocalizedField> orderdResult = [];
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

  // update id to be ordered
  for (var day in result) {
    orderdResult.add(
      day.copyWith(
        id: (result.indexOf(day) + 1).toString(),
      ),
    );
  }

  return orderdResult;
}
