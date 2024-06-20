import 'package:flutter/material.dart';
import 'package:kimofit/core/theming/style.dart';

class SupplementScreen extends StatelessWidget {
  const SupplementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supplement Screen'),
      ),
      body: Center(
        child: Text(
          'Supplement Screen',
          style: TextStyles.font18BlueBold,
        ),
      ),
    );
  }
}
