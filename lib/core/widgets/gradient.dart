import 'package:flutter/material.dart';
import 'package:kimofit/core/constants/colors.dart';

class GradientWidget extends StatelessWidget {
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
  final List<double>? stops;

  const GradientWidget({
    super.key,
    this.colors = const [ColorsManager.blue, ColorsManager.blueTransparent],
    this.begin = Alignment.bottomCenter,
    this.end = Alignment.topCenter,
    this.stops = const [0.20, 0.6],
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: begin,
              end: end,
              stops: stops,
            ),
          ),
        );
      },
    );
  }
}
