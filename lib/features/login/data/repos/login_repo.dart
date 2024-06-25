import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/core/networking/user_credentials/user_credentials.dart';
import 'package:kimofit/core/networking/user_credentials/user_credentials_model.dart';
import 'package:kimofit/features/login/data/models/login_request_model.dart';

class LoginRepo {
  final ApiConsumer api;
  LoginRepo(
    this.api,
  );
  Future<Either<String, UserCredentialsModel>> login({
    required LoginRequestModel loginRequest,
  }) async {
    try {
      final response = await api.post(
        ApiEndPoints.login,
        data: loginRequest.toJson(),
      );
      final UserCredentialsModel loginResponse =
          UserCredentialsModel.fromJson(response);
      UserCredentials.saveAll(loginResponse);

      return Right(loginResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
