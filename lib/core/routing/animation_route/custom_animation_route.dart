import 'package:flutter/material.dart';

class CustomAnimatedRoute extends PageRouteBuilder {
  final Widget screenWrapper;

  CustomAnimatedRoute({required this.screenWrapper})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              screenWrapper,
          transitionDuration: const Duration(milliseconds: 1500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.fastLinearToSlowEaseIn,
              reverseCurve: Curves.fastOutSlowIn,
            );
            return ScaleTransition(
              alignment: const Alignment(0, -0.5),
              scale: animation,
              child: child,
            );
          },
        );
}
