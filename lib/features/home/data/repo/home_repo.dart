import 'package:dartz/dartz.dart';
import 'package:kimofit/core/cache/cache_helper.dart';
import 'package:kimofit/core/di/dependency_injection.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/features/home/data/models/home_response_model/home_response_model.dart';

class HomeRepo {
  final ApiConsumer api;
  HomeRepo(this.api);

  Future<Either<String, HomeResponseModel>> getHomeData() async {
    try {
      final response = await api.get(ApiEndPoints.home);
      final HomeResponseModel homeResponseModel =
          HomeResponseModel.fromJson(response);

      // Save the trainerName in cache
      await saveTrainerName(homeResponseModel.trainerName);

      return Right(homeResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.homeErrorMessage!);
    }
  }
}

// Save the trainerName in cache Method
Future<void> saveTrainerName(LocalizedField trainerName) async {
  await getIt<CacheHelper>().saveLocalizedField(
    key: ApiKey.trainerName,
    value: trainerName,
  );
}
