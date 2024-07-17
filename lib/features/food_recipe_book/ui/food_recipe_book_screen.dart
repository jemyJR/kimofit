import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/food_recipe_book/ui/widget/food_recipe_book_bloc_builder.dart';

class FoodRecipeBookScreen extends StatelessWidget {
  final String title;

  const FoodRecipeBookScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: const FoodRecipeBookBlocBuilder(),
    );
  }
}
