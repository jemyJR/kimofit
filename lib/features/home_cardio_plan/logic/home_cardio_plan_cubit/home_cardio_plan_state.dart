part of 'home_cardio_plan_cubit.dart';

sealed class HomeCardioPlanState {}

final class HomeCardioPlanInitial extends HomeCardioPlanState {}

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
