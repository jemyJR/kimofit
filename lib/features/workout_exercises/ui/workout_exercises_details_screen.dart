import 'package:flutter/material.dart';
import 'package:kimofit/features/workout_exercises/data/enums/weight_type_enum.dart';
import 'package:kimofit/features/workout_exercises/ui/widgets/exercise_log/weight_picker.dart';

class WorkoutExercisesDetailsScreen extends StatelessWidget {
  const WorkoutExercisesDetailsScreen({
    super.key,
    required this.exerciseModel,
  });

  final dynamic exerciseModel;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: WeightPicker(weightType: WeightType.plateWeights),
      ),
    );
  }
}
