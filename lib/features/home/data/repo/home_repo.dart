import 'package:dartz/dartz.dart';
import 'package:kimofit/core/helpers/localized_field.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';
import 'package:kimofit/features/home/data/models/home_response_model/home_response_model.dart';

class HomeRepo {
  final ApiConsumer api;
  HomeRepo(this.api);

  Future<Either<LocalizedField, HomeResponseModel>> getHomeData() async {
    try {
      final response = await api.get(ApiEndPoints.home);
      final HomeResponseModel homeResponseModel =
          HomeResponseModel.fromJson(response);

      return Right(homeResponseModel);
    } on ServerException catch (e) {
      return Left(e.errorModel.trainerName!);
    }
  }
}
