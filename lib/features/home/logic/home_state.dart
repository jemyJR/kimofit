part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final HomeResponseModel homeResponseModel;
  HomeSuccess({required this.homeResponseModel});
}

final class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure({required this.errorMessage});
}
