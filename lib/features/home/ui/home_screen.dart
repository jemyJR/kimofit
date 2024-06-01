import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyles.font18BlueBold,
        ),
      ),
      body: Center(
        child: Text(
          'Home Screen',
          style: TextStyles.font18BlueBold,
        ),
      ),
    );
  }
}
