part of 'home_cardio_calendar_cubit.dart';

sealed class HomeCardioCalendarState {}

final class HomeCardioCalendarInitial extends HomeCardioCalendarState {}

//! Home cardio calendar states
final class HomeCardioCalendarLoading extends HomeCardioCalendarState {}

final class HomeCardioCalendarSuccess extends HomeCardioCalendarState {
  final List<LocalizedField> days;
  final List<LocalizedField> weeks;
  final LocalizedField selectedDay;
  final LocalizedField selectedWeek;

  HomeCardioCalendarSuccess({
    required this.days,
    required this.weeks,
    required this.selectedDay,
    required this.selectedWeek,
  });

  HomeCardioCalendarSuccess copyWith({
    List<LocalizedField>? days,
    List<LocalizedField>? weeks,
    LocalizedField? selectedDay,
    LocalizedField? selectedWeek,
  }) {
    return HomeCardioCalendarSuccess(
      days: days ?? this.days,
      weeks: weeks ?? this.weeks,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedWeek: selectedWeek ?? this.selectedWeek,
    );
  }
}

final class HomeCardioCalendarFailure extends HomeCardioCalendarState {
  final String errorMessage;
  HomeCardioCalendarFailure({required this.errorMessage});
}
