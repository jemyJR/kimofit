import 'package:dartz/dartz.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/features/login/data/models/login_request_model.dart';
import 'package:kimofit/features/login/data/models/login_response_model.dart';

class LoginRepo {
  final ApiConsumer api;
  LoginRepo(
    this.api,
  );
  Future<Either<String, LoginResponseModel>> login({
    required LoginRequestModel loginRequest,
  }) async {
    try {
      final response = await api.post(
        ApiEndPoints.login,
        data: loginRequest.toJson(),
      );
      final LoginResponseModel loginResponse =
          LoginResponseModel.fromJson(response);
      saveUserCredentials(loginResponse);
      return Right(loginResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }

  void saveUserCredentials(LoginResponseModel loginResponse) {
    getIt<CacheHelper>()
        .saveSecuredData(key: ApiKey.token, value: loginResponse.token);
    getIt<CacheHelper>().saveSecuredData(
        key: ApiKey.refreshToken, value: loginResponse.refreshToken);
  }
}
