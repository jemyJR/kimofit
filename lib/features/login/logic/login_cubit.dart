import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/device_info_service.dart';
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

  Future<void> _loadDeviceId() async {
    deviceId = await getIt<CacheHelper>().getData(key: Constants.deviceId) ??
        await DeviceUtils.getDeviceId();
  }

  login() async {
    emit(LoginLoading());

    await _loadDeviceId();

    final loginResponse = await loginRepo.login(
        loginRequest: LoginRequestModel(
      phone: phone,
      password: password,
      deviceId: await DeviceUtils.generateUniqueId(phone, password, deviceId),
    ));

    loginResponse.fold(
      (errorMessage) => emit(LoginFailure(errorMessage: errorMessage)),
      (loginResponseModel) {
        emit(LoginSuccess());
      },
    );
  }
}
