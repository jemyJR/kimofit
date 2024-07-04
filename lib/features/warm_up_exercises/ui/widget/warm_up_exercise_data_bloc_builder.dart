import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/exercise_slider/exercise_slider.dart';
import 'package:kimofit/core/widgets/no_data_widget.dart';
import 'package:kimofit/features/warm_up_exercises/data/models/warm_up_category_model.dart';
import 'package:kimofit/features/warm_up_exercises/logic/warm_up_cubit.dart';
import 'package:kimofit/features/warm_up_exercises/ui/widget/exercise_slider_shimmer.dart';
import 'package:kimofit/features/warm_up_exercises/ui/widget/warm_up_exercise_details_base.dart';

class WarmUpExerciseDataBlocBuilder extends StatelessWidget {
  const WarmUpExerciseDataBlocBuilder({super.key, required this.category});
  final WarmUpCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarmUpCubit, WarmUpState>(
      builder: (context, state) {
        if (state is WarmUpExerciseLoading) {
          return WarmUpExerciseDetailsBase(
            category: category,
            child: const ExerciseSliderShimmer(),
          );
        }

        if (state is WarmUpExerciseSuccess) {
          final warmUpExerciseResponseModel = state.warmUpExerciseResponseModel;
          final warmUpExercises = warmUpExerciseResponseModel.results;

          if (warmUpExercises.isEmpty) {
            return const NoDataWidget();
          } else {
            return WarmUpExerciseDetailsBase(
              category: category,
              child: ExerciseSlider(
                exercises: warmUpExercises,
              ),
            );
          }
        }

        if (state is WarmUpExerciseFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
