part of 'calendar_cubit.dart';

sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}

final class CalendarLoading extends CalendarState {}

final class CalendarSuccess extends CalendarState {
  final List<LocalizedField> days;
  final List<LocalizedField> weeks;
  final LocalizedField selectedDay;
  final LocalizedField selectedWeek;

  CalendarSuccess({
    required this.days,
    required this.weeks,
    required this.selectedDay,
    required this.selectedWeek,
  });

  CalendarSuccess copyWith({
    List<LocalizedField>? days,
    List<LocalizedField>? weeks,
    LocalizedField? selectedDay,
    LocalizedField? selectedWeek,
  }) {
    return CalendarSuccess(
      days: days ?? this.days,
      weeks: weeks ?? this.weeks,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedWeek: selectedWeek ?? this.selectedWeek,
    );
  }
}

final class CalendarFailure extends CalendarState {
  final String errorMessage;
  CalendarFailure({required this.errorMessage});
}
