import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/params/calendar_day_params.dart';
import 'package:kimofit/features/timer_and_calendar/data/calendar_list.dart';
import 'package:kimofit/features/timer_and_calendar/data/repo/calendar_repo.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit({
    required this.repo,
    required this.cachedWeekKey,
    required this.cachedDayKey,
  }) : super(CalendarInitial());

  final CalendarRepo repo;
  final String cachedWeekKey;
  final String cachedDayKey;

  //! Track current selected week and day
  LocalizedField? currentSelectedWeek;
  LocalizedField? currentSelectedDay;
  List<LocalizedField>? currentDayList;

  LocalizedField emptyLocalizedField = LocalizedField(id: '', en: '', ar: '');

  //! Save and get Selected Value
  Future<void> saveSelectedValue({
    required String preferenceKey,
    required LocalizedField value,
  }) async {
    final valueJson = jsonEncode(value.toJson());
    getIt<CacheHelper>().saveData(key: preferenceKey, value: valueJson);
  }

  LocalizedField? getSelectedValue(String preferenceKey) {
    final selectedValueJson =
        getIt<CacheHelper>().getDataString(key: preferenceKey);
    return selectedValueJson != null
        ? LocalizedField.fromJson(jsonDecode(selectedValueJson))
        : null;
  }

  //! Load weeks
  Future<void> loadWeeks() async {
    emit(CalendarLoading());

    try {
      LocalizedField? cachedWeek = getSelectedValue(cachedWeekKey);

      LocalizedField initialWeek = cachedWeek ?? weeks.first;

      currentSelectedWeek = initialWeek;
      saveSelectedValue(
        preferenceKey: cachedWeekKey,
        value: initialWeek,
      );

      emit(CalendarSuccess(
        weeks: weeks,
        selectedWeek: initialWeek,
        days: [],
        selectedDay: emptyLocalizedField,
      ));

      await getDays(
        calendarDaysParams: CalendarDaysParams(week: initialWeek.id),
      );
    } catch (error) {
      emit(CalendarFailure(errorMessage: error.toString()));
    }
  }

  //! Get days
  Future<void> getDays({
    required CalendarDaysParams calendarDaysParams,
  }) async {
    emit(CalendarLoading());

    final response = await repo.getDays(calendarDaysParams: calendarDaysParams);

    response.fold(
      (errorMessage) => emit(CalendarFailure(errorMessage: errorMessage)),
      (responseModel) {
        List<LocalizedField> days = responseModel.days;
        currentDayList = days;

        LocalizedField? cachedDay = getSelectedValue(cachedDayKey);
        LocalizedField cachedWeek =
            getSelectedValue(cachedWeekKey) ?? weeks.first;

        LocalizedField initialDay;
        if (cachedDay != null) {
          int index = int.tryParse(cachedDay.id) ?? 1;
          initialDay = days[index - 1];
        } else {
          initialDay = days.first;
        }

        currentSelectedDay = initialDay;
        emit(CalendarSuccess(
          days: days,
          weeks: weeks,
          selectedDay: initialDay,
          selectedWeek: cachedWeek,
        ));

        saveSelectedValue(
          preferenceKey: cachedDayKey,
          value: initialDay,
        );
      },
    );
  }

  //! Select Week and Day
  void selectDay(LocalizedField day) {
    saveSelectedValue(
      preferenceKey: cachedDayKey,
      value: day,
    );

    final currentState = state;
    if (currentState is CalendarSuccess) {
      currentSelectedDay = day;
      emit(currentState.copyWith(selectedDay: day));
    }
  }

  Future<void> selectWeek(LocalizedField week) async {
    saveSelectedValue(
      preferenceKey: cachedWeekKey,
      value: week,
    );
    currentSelectedWeek = week;
    await getDays(
      calendarDaysParams: CalendarDaysParams(week: week.id),
    );
  }
}
