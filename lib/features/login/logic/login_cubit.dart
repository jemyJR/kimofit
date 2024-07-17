import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/helpers/device_id_service.dart';
import 'package:kimofit/features/login/data/models/login_request_model.dart';
import 'package:kimofit/features/login/data/repos/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  final LoginRepo loginRepo;
  GlobalKey<FormState> loginFormKey = GlobalKey();
  String phone = '';
  String password = '';
  String deviceId = '';

  login() async {
    emit(LoginLoading());

    final loginResponse = await loginRepo.login(
        loginRequest: LoginRequestModel(
      phone: phone,
      password: password,
      deviceId: await DeviceIdService.getDeviceId(),
    ));

    loginResponse.fold(
      (errorMessage) => emit(LoginFailure(errorMessage: errorMessage)),
      (loginResponseModel) {
        emit(LoginSuccess());
      },
    );
  }
}
