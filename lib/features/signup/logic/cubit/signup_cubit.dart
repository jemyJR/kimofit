import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/features/signup/data/models/signup_request_model.dart';
import 'package:kimofit/features/signup/data/repos/signup_repo.dart';

import '../../../../core/helpers/device_info_service.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial()) {
    _loadDeviceId();
  }
  final SignupRepo signupRepo;

  GlobalKey<FormState> signupFormKey = GlobalKey();
  String name = '';
  String phone = '';
  String password = '';
  String deviceId = '';

  Future<void> _loadDeviceId() async {
    deviceId = await getIt<CacheHelper>().getData(key: Constants.deviceId) ??
        await DeviceUtils.getDeviceId();
  }

  signup() async {
    emit(SignupLoading());

    await _loadDeviceId();

    final signupResponse = await signupRepo.signup(
        signupRequest: SignupRequestModel(
      name: name,
      phone: phone,
      password: password,
      deviceId: deviceId,
    ));

    signupResponse.fold(
      (errorMessage) =>
          emit(SignupFailure(phone: errorMessage, deviceId: errorMessage)),
      (signupResponse) {
        emit(SignupSuccess());
      },
    );
  }
}
