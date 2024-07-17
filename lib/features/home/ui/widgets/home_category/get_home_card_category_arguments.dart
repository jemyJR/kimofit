//? Set badged to true for
// foodRecipeBookScreen if the user does not have a golden subscription
// workoutExercisesScreen if the user is not paid.

//? Set locked and colorFiltered to true if
// the user does not have a golden subscription for foodRecipeBookScreen
// or is not paid for other screens.

//? Adjust routeName and arguments if the item is locked to show the subscription screen.

import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/features/home/data/models/subscription_features_model.dart';
import 'package:kimofit/features/home/ui/widgets/home_category/home_cadegory_arguments_model.dart';
import 'package:kimofit/generated/l10n.dart';

HomeCardCategoryArguments getHomeCardCategoryArguments({
  required BuildContext context,
  required String homeCategoryNav,
  required int index,
  required String text,
  required bool isPaid,
  required bool goldenSubscription,
}) {
  final isFoodRecipeBookScreen = homeCategoryNav == Routes.foodRecipeBookScreen;
  final isWorkoutExercisesScreen =
      homeCategoryNav == Routes.workoutExercisesScreen;

  final String badgedText =
      isWorkoutExercisesScreen ? S.of(context).free : S.of(context).golden;
  final Color badgeColor =
      isWorkoutExercisesScreen ? ColorsManager.green : ColorsManager.yellow;

  HomeCardCategoryArguments args = HomeCardCategoryArguments(
    routeName: homeCategoryNav,
    arguments: text,
    badged: false,
    badgedText: badgedText,
    badgeColor: badgeColor,
    locked: false,
    colorFiltered: false,
  );

  if (isFoodRecipeBookScreen) {
    args = args.copyWith(badged: !goldenSubscription);
    if ((isPaid && !goldenSubscription) || !isPaid) {
      args = args.copyWith(locked: true, colorFiltered: true);
    }
  } else if (isWorkoutExercisesScreen) {
    args = args.copyWith(badged: !isPaid);
  } else if (!isPaid) {
    args = args.copyWith(locked: true, colorFiltered: true);
  }

  if (args.locked) {
    args = args.copyWith(
      routeName: Routes.subscriptionScreen,
      arguments: subscriptionFeatures[index],
    );
  }

  return args;
}
