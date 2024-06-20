import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/features/home/data/models/home_response_model/home_category_model.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/custom_home_container.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView(
      {super.key, required this.homeCategories, required this.isPaid});
  final List<HomeCategoryModel> homeCategories;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: homeCategories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final category = homeCategories[index];
          return CustomHomeContainer(
            homeCategoryNav: homeCategoriesScreens[index],
            index: index,
            text: category.name.getLocalizedText(),
            color: ColorsManager.blue,
            imagePath: category.image,
            isPaid: isPaid,
          );
        });
  }
}
