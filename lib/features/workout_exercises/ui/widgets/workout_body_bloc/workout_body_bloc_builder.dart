import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/widgets/custom_snack_bar.dart';
import 'package:kimofit/core/widgets/no_data_widget.dart';
import 'package:kimofit/features/home_cardio_plan/data/enums/exercise_status_enum.dart';
import 'package:kimofit/core/widgets/rest_day_widget.dart';
import 'package:kimofit/features/timer_and_calendar/logic/exercise_body_cubit/exercise_body_cubit.dart';
import 'package:kimofit/features/timer_and_calendar/logic/exercise_body_cubit/exercise_body_state.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_body_bloc/show_workout_body_loading.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_body_bloc/show_workout_body_success.dart';

class WorkoutBodyBlocBuilder extends StatelessWidget {
  const WorkoutBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseBodyCubit, ExerciseBodyState>(
      builder: (context, state) {
        if (state is ExerciseBodyLoading) {
          return const ShowWorkoutBodyLoading();
        }

        if (state is ExerciseBodySuccess) {
          final workoutBodyResponseModel = state.exerciseBodyResponseModel;
          final workoutBody = workoutBodyResponseModel.workoutFields;
          final cubit = context.read<ExerciseBodyCubit>();
          if (cubit.type == ExerciseStatus.restDay) {
            return const RestDayWidget();
          } else if (cubit.type == ExerciseStatus.notFoundDay) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: const NoDataWidget(),
            );
          } else {
            return ShowWorkoutBodySuccess(workoutBody: workoutBody);
          }
        }

        if (state is ExerciseBodyFailure) {
          customSnackBar(context, state.errorMessage);
          return const SizedBox.shrink();
        }

        return const SizedBox.shrink();
      },
    );
  }
}
