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

//! Home cardio plan exercises states
final class HomeCardioPlanLoading extends HomeCardioPlanState {}

final class HomeCardioPlanSuccess extends HomeCardioPlanState {
  final HomeCardioPlanResponseModel homeCardioPlanResponseModel;
  HomeCardioPlanSuccess({required this.homeCardioPlanResponseModel});
}

final class HomeCardioPlanFailure extends HomeCardioPlanState {
  final String errorMessage;
  HomeCardioPlanFailure({required this.errorMessage});
}
