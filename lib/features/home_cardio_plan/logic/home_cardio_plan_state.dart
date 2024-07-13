part of 'home_cardio_plan_cubit.dart';

sealed class HomeCardioPlanState {}

final class HomeCardioPlanInitial extends HomeCardioPlanState {}

//! Home cardio calender states

final class HomeCardioCalenderLoading extends HomeCardioPlanState {}

final class HomeCardioCalenderSuccess extends HomeCardioPlanState {
  final HomeCardioCalenderResponseModel homeCardioCalenderResponseModel;
  HomeCardioCalenderSuccess({required this.homeCardioCalenderResponseModel});
}

final class HomeCardioCalenderFailure extends HomeCardioPlanState {
  final String errorMessage;
  HomeCardioCalenderFailure({required this.errorMessage});
}
