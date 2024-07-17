part of 'food_recipe_book_cubit.dart';

sealed class FoodRecipeBookState {}

final class FoodRecipeBookInitial extends FoodRecipeBookState {}

final class FoodRecipeBookLoading extends FoodRecipeBookState {}

final class FoodRecipeBookSuccess extends FoodRecipeBookState {
  final String pdfUrl;

  FoodRecipeBookSuccess({required this.pdfUrl});
}

final class FoodRecipeBookFailure extends FoodRecipeBookState {
  final String errorMessage;

  FoodRecipeBookFailure({required this.errorMessage});
}
