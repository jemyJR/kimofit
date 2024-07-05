import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kimofit/core/constants/constants.dart';
import 'package:kimofit/core/helpers/extensions.dart';
import 'package:kimofit/core/routing/routes.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/custom_sub_container.dart';
import 'package:kimofit/core/widgets/custom_sub_container_shimmer.dart';
import 'package:kimofit/core/widgets/hero_animation.dart';
import 'package:kimofit/core/widgets/no_data_widget.dart';
import 'package:kimofit/features/warm_up_exercises/logic/warm_up_cubit.dart';

class WarmUpExerciseCategoryBlocBuilder extends StatelessWidget {
  const WarmUpExerciseCategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarmUpCubit, WarmUpState>(
      builder: (context, state) {
        if (state is WarmUpCategoryLoading) {
          return HeroAnimation(
            tag: Constants.warmUpHeroTag,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomSubContainerShimmer(
                  height: 150.h,
                );
              },
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          );
        }

        if (state is WarmUpCategorySuccess) {
          final warmUpCategoryList = state.warmUpCategoryResponseModel;

          if (warmUpCategoryList.isEmpty) {
            return const NoDataWidget();
          } else {
            return HeroAnimation(
              tag: Constants.warmUpHeroTag,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // make this as column not listview because the listview will make the hero animation not work correctly ( widget jump )
                  children: List.generate(
                    warmUpCategoryList.length,
                    (index) {
                      final category = warmUpCategoryList[index];
                      return CustomSubContainer(
                        title: category.name.getLocalizedText(),
                        imagePath: category.image,
                        height: 150.h,
                        onTap: () => context.pushNamed(
                          Routes.warmUpExercisesDetailsScreen,
                          arguments: category,
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        }

        if (state is WarmUpCategoryFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
