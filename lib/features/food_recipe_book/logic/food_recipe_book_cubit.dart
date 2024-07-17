import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/features/food_recipe_book/data/repo/food_recipe_book_repo.dart';

part 'food_recipe_book_state.dart';

class FoodRecipeBookCubit extends Cubit<FoodRecipeBookState> {
  FoodRecipeBookCubit(this.foodRecipeBookRepo) : super(FoodRecipeBookInitial());
  final FoodRecipeBookRepo foodRecipeBookRepo;

  //! get Food Recipe Book pdf
  Future<void> getFoodRecipeBook() async {
    emit(FoodRecipeBookLoading());
    final response = await foodRecipeBookRepo.getFoodRecipeBook();
    response.fold(
      (errorMessage) => emit(FoodRecipeBookFailure(errorMessage: errorMessage)),
      (pdfUrl) => emit(
        FoodRecipeBookSuccess(pdfUrl: pdfUrl),
      ),
    );
  }
}
