import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/features/signup/data/models/signup_request_model.dart';
import 'package:kimofit/features/signup/data/repos/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial());

  final SignupRepo signupRepo;

  GlobalKey<FormState> signupFormKey = GlobalKey();
  String name = '';
  String phone = '';
  String password = '';
  String deviceId = SavedData.deviceId;

  signup() async {
    emit(SignupLoading());

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
