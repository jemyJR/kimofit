import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';

class WarmUpExercisesScreen extends StatelessWidget {
  const WarmUpExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warm Up Exercises'),
      ),
      body: Center(
        child: Text(
          'Warm Up Exercises',
          style: TextStyles.font18BlueBold,
        ),
      ),
    );
  }
}
