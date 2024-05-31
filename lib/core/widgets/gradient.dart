import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.blue,
            ColorsManager.blue.withOpacity(0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.20, 0.6],
        ),
      ),
    );
  }
}
