part of 'signup_cubit.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupFailure extends SignupState {
  final String? phone;
  final String? deviceId;
  SignupFailure({this.phone, this.deviceId});
}
