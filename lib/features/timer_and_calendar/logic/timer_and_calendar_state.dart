part of 'timer_and_calendar_cubit.dart';

sealed class TimerAndCalendarState {}

final class TimerAndCalendarInitial extends TimerAndCalendarState {}

// //! Calendar Mode
class CalendarModeState extends TimerAndCalendarState {}

//! Timer Options Mode
class TimerOptionsModeState extends TimerAndCalendarState {}

//! Countdown Timer Mode
class CountdownTimerState extends TimerAndCalendarState {
  final int duration;
  CountdownTimerState({required this.duration});
}

//! TimeUp Mode
class TimeUpModeState extends TimerAndCalendarState {}
