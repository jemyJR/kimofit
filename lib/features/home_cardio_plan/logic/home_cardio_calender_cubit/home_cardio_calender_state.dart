part of 'home_cardio_calender_cubit.dart';

sealed class HomeCardioCalenderState {}

final class HomeCardioCalenderInitial extends HomeCardioCalenderState {}

//! Home cardio calender states
final class HomeCardioCalenderLoading extends HomeCardioCalenderState {}

final class HomeCardioCalenderSuccess extends HomeCardioCalenderState {
  final List<LocalizedField> days;
  final List<LocalizedField> weeks;
  final LocalizedField selectedDay;
  final LocalizedField selectedWeek;

  HomeCardioCalenderSuccess({
    required this.days,
    required this.weeks,
    required this.selectedDay,
    required this.selectedWeek,
  });

  HomeCardioCalenderSuccess copyWith({
    List<LocalizedField>? days,
    List<LocalizedField>? weeks,
    LocalizedField? selectedDay,
    LocalizedField? selectedWeek,
  }) {
    return HomeCardioCalenderSuccess(
      days: days ?? this.days,
      weeks: weeks ?? this.weeks,
      selectedDay: selectedDay ?? this.selectedDay,
      selectedWeek: selectedWeek ?? this.selectedWeek,
    );
  }
}

final class HomeCardioCalenderFailure extends HomeCardioCalenderState {
  final String errorMessage;
  HomeCardioCalenderFailure({required this.errorMessage});
}
