import 'package:dartz/dartz.dart';
import 'package:kimofit/core/networking/api/api_consumer.dart';
import 'package:kimofit/core/networking/api/api_endpoints.dart';
import 'package:kimofit/core/networking/errors/error_handle_exeptions.dart';

class FoodRecipeBookRepo {
  final ApiConsumer api;
  FoodRecipeBookRepo(this.api);

  //! get Food Recipe Book pdf
  Future<Either<String, String>> getFoodRecipeBook() async {
    try {
      final response = await api.get(
        ApiEndPoints.foodRecipeBook,
      );
      final foodRecipeBook = response[ApiKey.foodRecipeBookAttachment];
      return Right(foodRecipeBook);
    } on ServerException catch (e) {
      return Left(e.errorModel.errorMessage!);
    }
  }
}
