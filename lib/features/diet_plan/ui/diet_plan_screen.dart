import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';

class DietPlanScreen extends StatelessWidget {
  const DietPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Plan Screen'),
      ),
      body: Center(
        child: Text(
          'Diet Plan Screen',
          style: TextStyles.font18BlueBold,
        ),
      ),
    );
  }
}
