import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kimofit/core/constants/colors.dart';
import 'package:kimofit/core/widgets/custom_app_bar.dart';
import 'package:kimofit/features/timer_and_calendar/logic/exercise_body_cubit/exercise_body_cubit.dart';
import 'package:kimofit/features/timer_and_calendar/ui/widgets/bloc_widgets/calendar_bloc_consumer.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_body_bloc/workout_body_bloc_builder.dart';

class WorkoutExercisesScreen extends StatelessWidget {
  const WorkoutExercisesScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bgDark,
      appBar: CustomAppBar(
        title: title,
      ),
      body: CalendarBlocConsumer(
        exerciseBodyCubit: context.read<ExerciseBodyCubit>(),
        exerciseBodyBlocBuilder: const WorkoutBodyBlocBuilder(),
      ),
    );
  }
}
