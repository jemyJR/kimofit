part of 'timer_and_calender_cubit.dart';

sealed class TimerAndCalenderState {}

final class TimerAndCalenderInitial extends TimerAndCalenderState {}

class TimerAndCalenderLoading extends TimerAndCalenderState {}

class TimerAndCalenderLoaded extends TimerAndCalenderState {
  final List<LocalizedField> days;
  final List<LocalizedField> weeks;
  final LocalizedField selectedDay;
  final LocalizedField selectedWeek;

  TimerAndCalenderLoaded({
    required this.days,
    required this.weeks,
    required this.selectedDay,
    required this.selectedWeek,
  });

  TimerAndCalenderLoaded copyWith({
    List<LocalizedField>? days,
    List<LocalizedField>? weeks,
    LocalizedField? selectedDay,
    LocalizedField? selectedWeek,
  }) {
    return TimerAndCalenderLoaded(
      days: days ?? this.days,
      weeks: weeks ?? this.weeks,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedWeek: selectedWeek ?? this.selectedWeek,
    );
  }
}

final class TimerAndCalenderFailure extends TimerAndCalenderState {
  final String errorMessage;
  TimerAndCalenderFailure({required this.errorMessage});
}

// //! Calender Mode
class CalenderModeState extends TimerAndCalenderState {}

//! Timer Options Mode
class TimerOptionsModeState extends TimerAndCalenderState {}

//! Countdown Timer Mode
class CountdownTimerState extends TimerAndCalenderState {
  final int duration;
  CountdownTimerState({required this.duration});
}

//! TimeUp Mode
class TimeUpModeState extends TimerAndCalenderState {}
