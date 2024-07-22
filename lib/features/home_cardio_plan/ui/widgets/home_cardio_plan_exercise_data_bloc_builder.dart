import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/exercise_slider/exercise_slider.dart';
import 'package:kimofit/core/widgets/no_data_widget.dart';
import 'package:kimofit/features/home_cardio_plan/logic/home_cardio_plan_cubit/home_cardio_plan_cubit.dart';
import 'package:kimofit/core/widgets/rest_day_widget.dart';
import 'package:kimofit/features/warm_up_exercises/ui/widget/exercise_slider_shimmer.dart';

class HomeCardioPlanExerciseBlocBuilder extends StatelessWidget {
  const HomeCardioPlanExerciseBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCardioPlanCubit, HomeCardioPlanState>(
      builder: (context, state) {
        if (state is HomeCardioPlanLoading) {
          return const ExerciseSliderShimmer();
        }

        if (state is HomeCardioPlanSuccess) {
          final homeCardioPlanResponseModel = state.homeCardioPlanResponseModel;
          final homeCardioExercises = homeCardioPlanResponseModel.results;
          final cubit = context.read<HomeCardioPlanCubit>();
          if (cubit.type == HomeCardioPlanExerciseStatus.restDay) {
            return const RestDayWidget();
          } else if (cubit.type == HomeCardioPlanExerciseStatus.notFoundDay) {
            return const NoDataWidget();
          } else {
            return ExerciseSlider(
              exercises: homeCardioExercises,
            );
          }
        }

        if (state is HomeCardioPlanFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
