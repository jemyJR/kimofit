part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

//! Change Password
final class ChangePasswordSuccess extends ProfileState {
  final String success;
  ChangePasswordSuccess({required this.success});
}

final class ChangePasswordLoading extends ProfileState {}

final class ChangePasswordFailure extends ProfileState {
  final String errorMessage;
  ChangePasswordFailure({required this.errorMessage});
}

//! Get Profile Data
final class GetProfleDataSuccess extends ProfileState {
  final ProfileResponseModel profileResponseModel;
  GetProfleDataSuccess({required this.profileResponseModel});
}

final class GetProfleDataLoading extends ProfileState {}

final class GetProfleDataFailure extends ProfileState {
  final String errorMessage;
  GetProfleDataFailure({required this.errorMessage});
}
