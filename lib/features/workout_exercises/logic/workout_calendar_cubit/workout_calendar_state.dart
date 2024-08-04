part of 'workout_calendar_cubit.dart';

sealed class WorkoutCalendarState {}

final class WorkoutCalendarInitial extends WorkoutCalendarState {}

//! Home cardio calendar states
final class WorkoutCalendarLoading extends WorkoutCalendarState {}

final class WorkoutCalendarSuccess extends WorkoutCalendarState {
  final List<LocalizedField> days;
  final List<LocalizedField> weeks;
  final LocalizedField selectedDay;
  final LocalizedField selectedWeek;

  WorkoutCalendarSuccess({
    required this.days,
    required this.weeks,
    required this.selectedDay,
    required this.selectedWeek,
  });

  WorkoutCalendarSuccess copyWith({
    List<LocalizedField>? days,
    List<LocalizedField>? weeks,
    LocalizedField? selectedDay,
    LocalizedField? selectedWeek,
  }) {
    return WorkoutCalendarSuccess(
      days: days ?? this.days,
      weeks: weeks ?? this.weeks,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedWeek: selectedWeek ?? this.selectedWeek,
    );
  }
}

final class WorkoutCalendarFailure extends WorkoutCalendarState {
  final String errorMessage;
  WorkoutCalendarFailure({required this.errorMessage});
}
