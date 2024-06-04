import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/features/signup/data/models/signup_request_model.dart';

class SignupRepo {
  final ApiConsumer api;
  SignupRepo(
    this.api,
  );
  Future<Either<String, String>> signup({
    required SignupRequestModel signupRequest,
  }) async {
    try {
      await api.post(
        ApiEndPoints.signup,
        data: signupRequest.toJson(),
      );

      return const Right('User created successfully');
    } on ServerException catch (e) {
      return Left(e.errorModel.phone ?? e.errorModel.deviceId ?? '');
    }
  }
}
