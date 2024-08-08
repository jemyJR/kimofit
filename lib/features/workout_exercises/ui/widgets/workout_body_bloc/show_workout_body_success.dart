import 'package:flutter/material.dart';
import 'package:kimofit/core/widgets/no_data_widget_small.dart';
import 'package:kimofit/features/workout_exercises/data/enums/exercise_type_eum.dart';
import 'package:kimofit/features/workout_exercises/data/models/exercise_fields_model.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_list_view_area.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/title_with_content.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/warmup_exercise_area.dart';
import 'package:kimofit/generated/l10n.dart';

class ShowWorkoutBodySuccess extends StatelessWidget {
  const ShowWorkoutBodySuccess({
    super.key,
    required this.workoutBody,
  });

  final ExerciseFieldsModel workoutBody;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithContent(
            title: S.of(context).warmUpExercises,
            child: workoutBody.warmUpExercise.isNotEmpty
                ? WarmUpExerciseArea(
                    warmUpExercise: workoutBody.warmUpExercise.first,
                  )
                : const NoDataWidgetSmall(),
          ),
          TitleWithContent(
            title: S.of(context).workoutExercises,
            child: workoutBody.workoutExercise.isNotEmpty
                ? ExerciseListViewArea(
                    exercisesList: workoutBody.workoutExercise,
                    type: ExerciseType.workout,
                  )
                : const NoDataWidgetSmall(),
          ),
          TitleWithContent(
            title: S.of(context).absExercises,
            child: workoutBody.absExercises.isNotEmpty
                ? ExerciseListViewArea(
                    exercisesList: workoutBody.absExercises,
                    type: ExerciseType.abs,
                  )
                : const NoDataWidgetSmall(),
          ),
          TitleWithContent(
            title: S.of(context).cardioExercises,
            child: workoutBody.cardioExercises.isNotEmpty
                ? ExerciseListViewArea(
                    exercisesList: workoutBody.cardioExercises,
                    type: ExerciseType.cardio,
                  )
                : const NoDataWidgetSmall(),
          ),
        ],
      ),
    );
  }
}
