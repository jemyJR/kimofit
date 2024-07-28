import 'package:flutter/material.dart';
import 'package:kimofit/core/helpers/spacing.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_log/show_exercise_log.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/notes_alert_dialog/show_notes_alert_dialog.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/workout_exercise_name_and_sets.dart';

class WorkoutExerciseBody extends StatelessWidget {
  const WorkoutExerciseBody({
    super.key,
    required this.exercise,
  });

  final dynamic exercise;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WorkoutExerciseNameAndSets(
                name: exercise.name.getLocalizedText(),
                sets: exercise.logs.length.toString(),
              ),
              horizontalSpace(10),
              exercise.notes.isNotEmpty
                  ? ShownotesAlertDialog(
                      notes: exercise.notes,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          ShowExerciseLog(
            name: exercise.name.getLocalizedText(),
            id: exercise.id,
            logs: exercise.logs,
          ),
        ],
      ),
    );
  }
}
