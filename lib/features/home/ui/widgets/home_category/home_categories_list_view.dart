import 'package:flutter/material.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/features/home/data/models/home_response_model/home_category_model.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/custom_home_container.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/get_home_card_category_arguments.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/home_cadegory_arguments_model.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({
    super.key,
    required this.homeCategories,
    required this.isPaid,
    required this.goldenSubscription,
  });

  final List<HomeCategoryModel> homeCategories;
  final bool isPaid;
  final bool goldenSubscription;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: homeCategories.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final category = homeCategories[index];
          HomeCardCategoryArguments homeCardCategoryArguments =
              getHomeCardCategoryArguments(
            context: context,
            homeCategoryNav: homeCategoriesScreens[index],
            index: index,
            text: category.name.getLocalizedText(),
            isPaid: isPaid,
            goldenSubscription: goldenSubscription,
          );
          return CustomHomeContainer(
            homeCardCategoryArguments: homeCardCategoryArguments,
            category: category,
          );
        });
  }
}
