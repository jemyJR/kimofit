import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';

class WorkoutExercisesScreen extends StatelessWidget {
  const WorkoutExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Exercises Screen'),
      ),
      body: Center(
        child: Text(
          'Workout Exercises Screen',
          style: TextStyles.font18BlueBold,
        ),
      ),
    );
  }
}
