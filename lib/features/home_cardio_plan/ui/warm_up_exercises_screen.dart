import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';

class HomeCardioPlanScreen extends StatelessWidget {
  const HomeCardioPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Cardio Plan Screen'),
      ),
      body: Center(
        child: Text(
          'Home Cardio Plan Screen',
          style: TextStyles.font18BlueBold,
        ),
      ),
    );
  }
}
